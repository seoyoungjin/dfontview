module fontview.ui.pangram;

import std.stdio;
import std.string;
import std.algorithm;

import dlangui;
import fontview.ui.appdata;

class Pangram : VerticalLayout
{
    this(string id) {
        super(id);
        fillParent();

        auto controls1 = new HorizontalLayout()
                .fillHorizontal
                .padding(3.pointsToPixels);
        controls1.addChild(new TextWidget(null, "Text:"d));
        EditLine itemtext = new EditLine(null);
        itemtext.layoutWidth(FILL_PARENT);
        controls1.addChild(itemtext);
        
        Button btn = new Button(null, "Apply"d);
        controls1.addChild(btn);

        auto pangramView = new PangramView("pangram");

        addChild(controls1);
        addChild(pangramView);

        btn.click = delegate(Widget src)
        {
            dstring s = strip(itemtext.text);
            appData.userText = s;
            return true;
        };
    }
}

class PangramView : ScrollWidget
{
    this(string id) {
        super(id);
        fillParent();
        _vscrollbarMode = ScrollBarMode.Auto;
        _hscrollbarMode = ScrollBarMode.Auto;

        auto canvas = new FontViewCanvas(this);
        canvas.layoutWidth = FILL_PARENT;
        canvas.layoutHeight = FILL_PARENT;
        canvas.backgroundColor = 0xFFFFFF;
        canvas.padding(Rect(10,10,10,10));

        // backgroundColor = canvas.backgroundColor;
        contentWidget = canvas;
    }

    /// override to support modification of client rect after change, e.g. apply offset
    override void handleClientRectLayout(ref Rect rc) {
        if (isSpecialSize(contentWidget.layoutWidth))
            contentWidget.layoutWidth = rc.width;
        if (isSpecialSize(contentWidget.layoutHeight))
            contentWidget.layoutHeight = rc.height;

        // approximate size of text string
        FontRef fnt = FontManager.instance.getFont(36, FontWeight.Normal, false,
                FontFamily.Unspecified, appData.fontFace);
        if (fnt.isNull)
            return;
        Point sz = fnt.textSize(appData.text());
        contentWidget.layoutWidth = max(clientRect.width, sz.x + 20);
        contentWidget.layoutHeight = max(clientRect.height, sz.y * 9 + 100);
    }
}

class FontViewCanvas : CanvasWidget {
    ScrollWidget _scroll;

    this(ScrollWidget w) {
        super();
        _scroll = w;
    }

    override void doDraw(DrawBuf buf, Rect rc) {
        FontRef fnt = FontManager.instance.getFont(16, FontWeight.Normal, false,
                FontFamily.Unspecified, appData.fontFace);
        if (fnt.isNull) {
            Log.d("Failed to getFont ", appData.fontFace);
            return;
        }

        dstring text = appData.text();

        // face name
        int y = rc.top; 
        dstring text1 = to!dstring(appData.fontFace);
        fnt.drawText(buf, rc.left, y, text1, textColor, 4, 0, textFlags);

        // contents
        fnt = FontManager.instance.getFont(12, FontWeight.Normal, false,
                FontFamily.Unspecified, appData.fontFace);
        if (fnt.isNull)
            return;

        y += fnt.height + 20;
        fnt.drawText(buf, rc.left, y, "abcdefghjklmnopqrstuvwxyz"d, textColor);
        y += fnt.height;
        fnt.drawText(buf, rc.left, y, "ABCDEFGHJKLMNOPQRSTUVWXYZ"d, textColor);
        y += fnt.height;
        fnt.drawText(buf, rc.left, y, "0123456789%2.:,;(*!?')"d, textColor);
        y += fnt.height;

        y += 20;
        foreach (size; [8, 9, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36]) {
            fnt = FontManager.instance.getFont(size, FontWeight.Normal, false,
                    FontFamily.Unspecified, appData.fontFace);
            if (fnt.isNull)
                continue;
            fnt.drawText(buf, rc.left, y, text, textColor);
            y += fnt.height + 5;
        }
    }
}
