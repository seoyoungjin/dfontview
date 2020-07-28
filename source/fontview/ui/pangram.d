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

        auto canvas = new PangramView("pangram");

        addChild(controls1);
        addChild(canvas);

        btn.click = delegate(Widget src)
        {
            dstring s = strip(itemtext.text);
            // canvas.userText = s;
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

        auto canvas = new FontViewCanvas;
        canvas.backgroundColor = 0xFFFFFF;
        canvas.layoutWidth = FILL_PARENT;
        canvas.layoutHeight = FILL_PARENT;
        canvas.layoutWidth = 500;
        canvas.layoutHeight = 800;
        canvas.padding(Rect(10,10,10,10));

        contentWidget = canvas;
    }
}

class FontViewCanvas : CanvasWidget {
    const dstring sampleText;
    const dstring sampleTextKo;
    dstring userText;

    this() {
        super();
        sampleText   = "The quick brown fox jumps over the lazy dog. 1234567890"d;
        sampleTextKo = "다람쥐 헌 쳇바퀴에 타고파. 1234567890"d;
    }

    protected void drawText(DrawBuf buf, Rect rc, dstring text){
        int y = rc.top; 
        FontRef font = FontManager.instance.getFont(16, FontWeight.Normal, false,
                FontFamily.Unspecified, appData.fontFace);
        if (font.isNull) {
            Log.d("Failed to getFont ", appData.fontFace);
            return;
        }

        // face name
        dstring text1 = to!dstring(appData.fontFace);
        font.drawText(buf, rc.left, y, text1, textColor, 4, 0, textFlags);

        // contents
        font = FontManager.instance.getFont(12, FontWeight.Normal, false,
                FontFamily.Unspecified, appData.fontFace);
        if (font.isNull)
            return;

        y += font.height + 20;
        font.drawText(buf, rc.left, y, "abcdefghjklmnopqrstuvwxyz"d, textColor);
        y += font.height;
        font.drawText(buf, rc.left, y, "ABCDEFGHJKLMNOPQRSTUVWXYZ"d, textColor);
        y += font.height;
        font.drawText(buf, rc.left, y, "0123456789%2.:,;(*!?')"d, textColor);
        y += font.height;

        y += 20;
        foreach (size; [8, 9, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36]) {
            font = FontManager.instance.getFont(size, FontWeight.Normal, false,
                    FontFamily.Unspecified, appData.fontFace);
            if (font.isNull)
                continue;
            font.drawText(buf, rc.left, y, text, textColor);
            y += font.height + 5;
        }
    }

    override void doDraw(DrawBuf buf, Rect rc) {
        if (userText.length > 0)
            drawText(buf,rc, userText);
        else
            drawText(buf,rc, sampleText);
    }
}