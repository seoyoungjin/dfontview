import std.stdio;

import dlangui;
import dlangui.graphics.fonts;

mixin APP_ENTRY_POINT;


/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) 
{
    Platform.instance.uiLanguage="en";
    Platform.instance.uiTheme="theme_default";

    // create window
    Window window = Platform.instance.createWindow("D FontView", null);

    HorizontalLayout longLists = new HorizontalLayout;
    longLists.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);

    ListWidget list = new ListWidget("list1", Orientation.Vertical);
    list.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);

    StringListAdapter stringList = new StringListAdapter();
    FontFaceProps[] faces = FontManager.instance.getFaces();
    for (auto i = 0; i < faces.length; ++i) {
        stringList.add(to!dstring(faces[i].face));
    }

    ListWidget fontList = new StringListWidget("FontList");
    fontList.ownAdapter = stringList;
    // fontList.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
    fontList.layoutWidth(200).layoutHeight(FILL_PARENT);
    fontList.selectItem(0);
    longLists.addChild(fontList);

    VerticalLayout vlayout = new VerticalLayout();
    vlayout.addChild(new TextWidget(null, "New item text:"d));
    EditLine itemtext = new EditLine(null, "Text for new item"d);
    vlayout.addChild(itemtext);
    
    Button btn = new Button(null, "Add item"d);
    btn.click = delegate(Widget src)
    {
        return true;
    };   
    vlayout.addChild(btn);

    auto canvas = new MyCanvasWidget;
    vlayout.addChild(canvas);
    canvas.layoutWidth(500).layoutHeight(500);
    
    longLists.addChild(vlayout);

    window.mainWidget = longLists;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

class MyCanvasWidget : CanvasWidget
{
    this() { }

    protected void drawText(DrawBuf buf, Rect rc, dstring text) {
        // FontRef font = font();
        FontRef font = FontManager.instance.getFont(25, FontWeight.Normal,
			false, FontFamily.SansSerif, "D2Coding");
    //		false, FontFamily.SansSerif, "Ubuntu Mono");
	//		false, FontFamily.SansSerif, "Arial");

    	writeln("face ", font.face());
    	writeln("isFixed ", font.isFixed());
    	writeln("italic ", font.italic());

        Point sz = font.textSize(text);
        applyAlign(rc, sz, Align.HCenter, Align.VCenter);
        font.drawText(buf, rc.left, rc.top, text, textColor, 4, 0, textFlags);

        writeln("width = ", this.width);
        writeln("height = ", this.height);
    }

    override void doDraw(DrawBuf buf, Rect rc) {
    	dstring sampleText = "안녕하세요 Hello"d;
        drawText(buf,rc, sampleText);
    }
}
