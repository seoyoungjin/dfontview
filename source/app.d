import std.stdio;
import std.conv : to;
import std.utf;

import dlangui;
import dlangui.widgets.scroll;
import dlangui.graphics.fonts;

mixin APP_ENTRY_POINT;


/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) 
{
    Platform.instance.uiLanguage="en";
    Platform.instance.uiTheme="theme_default";

    // create window
    Window window = Platform.instance.createWindow("D FontView", null,
            WindowFlag.Resizable, 600, 400);

    HorizontalLayout horiz = new HorizontalLayout;
    horiz.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);

    ListWidget left = new ListWidget("left", Orientation.Vertical);

    WidgetListAdapter listAdapter = new WidgetListAdapter();
    FontFaceProps[] faces = FontManager.instance.getFaces();
    Log.i("Number of Faces : ", faces.length);
    for (auto i = 0; i < faces.length; ++i) {
        auto label = new TextWidget();
        label.styleId = "LIST_ITEM";
        Log.i("Face : ", faces[i].face);
        try {
            label.text = to!dstring(faces[i].face);
        }
        catch (UTFException e) {
            label.text = "-----"d;
        }
        listAdapter.add(label);
    }
    left.ownAdapter = listAdapter;
    left.layoutWidth(200).layoutHeight(FILL_PARENT);
    // left.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
    left.selectItem(0);

    // content
    auto content = new VerticalLayout().fillParent;

    // control1
    auto controls1 = new HorizontalLayout().fillHorizontal
            .padding(3.pointsToPixels).backgroundColor(0xD8D8D8);
    controls1.addChild(new TextWidget(null, "Text:"d));
    EditLine itemtext = new EditLine(null);
    itemtext.layoutWidth(FILL_PARENT);
    controls1.addChild(itemtext);
    
    Button btn = new Button(null, "Apply"d);
    btn.click = delegate(Widget src)
    {
        return true;
    };   
    controls1.addChild(btn);

    auto canvas = new MyCanvasWidget;
    canvas.backgroundColor = 0xFFFF00;
    canvas.layoutWidth = FILL_PARENT;
    canvas.layoutHeight = FILL_PARENT;
    canvas.padding(Rect(10,10,10,10));

    content.addChildren([controls1, canvas]);

    left.itemClick = delegate(Widget source, int index) {
        ListWidget left = cast(ListWidget)source;
        canvas.fontFace = to!string(left.itemWidget(index).text);
        Log.i("face : ", canvas.fontFace);
        return true;
    };

    horiz.addChildren([left, content]);
    window.mainWidget = horiz;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

class MyCanvasWidget : CanvasWidget
{
    this() { }

    protected void drawText(DrawBuf buf, Rect rc, dstring text) {
        FontRef font = font();
        /*
        FontRef font = FontManager.instance.getFont(25, FontWeight.Normal,
            false, FontFamily.SansSerif, gFontFace);
            */

        Log.d("face ", font.face());

        dstring t = to!dstring(font.face()) ~ " " ~ text;

        Point sz = font.textSize(text);
        applyAlign(rc, sz, Align.HCenter, Align.VCenter);
        // font.drawText(buf, rc.left, rc.top, text, textColor, 4, 0, textFlags);
        font.drawText(buf, rc.left, rc.top, t, textColor, 4, 0, textFlags);
    }

    override void doDraw(DrawBuf buf, Rect rc) {
        // dstring sampleText = "Hello"d;
        dstring sampleText = "안녕하세요"d;
        drawText(buf,rc, sampleText);
    }
}
