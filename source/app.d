import std.stdio;
import std.string;
import std.conv : to;
import std.utf;

import dlangui;
import fontview.ui.frame;
/*
import dlangui.widgets.scroll;
import dlangui.graphics.fonts;
*/

mixin APP_ENTRY_POINT;


/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) 
{
   // embed non-standard resources listed in views/resources.list into executable
    embeddedResourceList.addResources(embedResourcesFromList!("resources.list")());

    /// set font gamma (1.0 is neutral, < 1.0 makes glyphs lighter, >1.0 makes glyphs bolder)
    FontManager.fontGamma = 0.8;
    FontManager.hintingMode = HintingMode.Normal;

    Platform.instance.uiLanguage = "en";
    Platform.instance.uiTheme = "theme_custom";

    // create window
    Window window = Platform.instance.createWindow("D FontView", null,
            WindowFlag.Resizable, 600, 400);

    auto frame = new FontViewFrame();
    auto left = new ListWidget("left", Orientation.Vertical);

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
            .padding(3.pointsToPixels);
    controls1.addChild(new TextWidget(null, "Text:"d));
    EditLine itemtext = new EditLine(null);
    itemtext.layoutWidth(FILL_PARENT);
    controls1.addChild(itemtext);
    
    Button btn = new Button(null, "Apply"d);
    controls1.addChild(btn);

    auto canvas = new FontViewCanvas;
    // canvas.backgroundColor = 0xFFFF00;
    canvas.layoutWidth = FILL_PARENT;
    canvas.layoutHeight = FILL_PARENT;
    canvas.padding(Rect(10,10,10,10));

    // auto property = new FontProperty;

    content.addChild(controls1);
    content.addChild(canvas);

    btn.click = delegate(Widget src)
    {
        dstring s = strip(itemtext.text);
        canvas.userText = s;
        // property.setFace(s);
        return true;
    };

    left.itemSelected = delegate(Widget source, int index) {
        ListWidget left = cast(ListWidget)source;
        canvas.userFontFace = to!string(left.itemWidget(index).text);
        return true;
    };

    frame.statusLine.setStatusText(format("%d font faces"d, faces.length));
    frame.frameBody.addChildren([left, content]);
    window.mainWidget = frame;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

class FontViewCanvas : CanvasWidget
{
    string userFontFace;
    const dstring sampleText;
    const dstring sampleTextKo;
    dstring userText;

    this() {
        sampleText   = "The quick brown fox jumps over the lazy dog. 1234567890"d;
        sampleTextKo = "다람쥐 헌 쳇바퀴에 타고파. 1234567890"d;
    }

    protected void drawText(DrawBuf buf, Rect rc, dstring text) {
        FontRef font = font();

        // label
        dstring text1 = to!dstring(userFontFace);
        font.drawText(buf, rc.left, rc.top, text1, textColor, 4, 0, textFlags);

        // contents
        FontRef font2 = FontManager.instance.getFont(25, FontWeight.Normal, false,
                FontFamily.Unspecified, userFontFace);
        if (font2.isNull)
            return;

        SimpleTextFormatter fmt;
        Point sz = fmt.format(text, font2, 0, rc.width, 4, 0, textFlags);
        applyAlign(rc, sz);
        // TODO: apply align to alignment lines
        fmt.draw(buf, rc.left, rc.top + 30, font2, textColor);
    }

    override void doDraw(DrawBuf buf, Rect rc) {
        if (userText.length > 0)
            drawText(buf,rc, userText);
        else
            drawText(buf,rc, sampleText);
    }
}


class FontProperty : VerticalLayout
{
    dstring face;
    TextWidget italic, bold, fixed, emsize;
    TextWidget font_file;

    this() {
        this(null);
    }
    this(string id) {
        super(id);
        italic = new TextWidget();
        bold = new TextWidget();
        fixed = new TextWidget();
        emsize = new TextWidget();
        font_file = new TextWidget();
        addChildren([italic, bold, fixed, emsize, font_file]);
        setFace(""d);
    }

    void setFace(dstring f) {
        face = f;
        italic.text = "Italic : true"d;
        bold.text = "Bold : true"d;
        fixed.text = "Fixed : true"d;
        emsize.text = "Emsize : 10"d;
        font_file.text = "NAME.TTF"d;
    }
}
