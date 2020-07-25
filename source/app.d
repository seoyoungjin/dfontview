import std.stdio;
import std.string;
import std.algorithm;
import std.conv : to;
import std.utf;

import dlangui;
import fontview.ui.frame;
import fontview.ui.pangram;

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

    auto left = new VerticalLayout().layoutWidth(200).layoutHeight(FILL_PARENT);
    auto fontFilter = new EditLine("fontFilter");
    fontFilter.margins(Rect(5,5,5,5));

    auto fontList = new StringListWidget("fontList");
    auto listAdapter = new StringListAdapter();
    updateFontList(listAdapter);
    fontList.ownAdapter = listAdapter;

    // listeners
    fontFilter.contentChange = delegate (EditableContent source) {
        updateFontList(listAdapter, source.text);
    };

    // left.margins(Rect(5,5,5,5));
    left.addChild(fontFilter);
    left.addChild(fontList);

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

    fontList.itemSelected = delegate(Widget source, int index) {
        ListWidget fontList = cast(ListWidget)source;
        canvas.fontFace = to!string(fontList.itemWidget(index).text);
        return true;
    };
    fontList.selectItem(0);
    fontList.itemSelected.emit(fontList, 0);

    frame.statusLine.setStatusText(format("%d font faces"d, fontList.itemCount));
    frame.frameBody.addChildren([left, content]);
    window.mainWidget = frame;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

void updateFontList(StringListAdapter listAdapter, dstring filter = null)
{
    // sorted font list
    FontFaceProps[] faceProps = FontManager.instance.getFaces();
    dstring[] faces;
    Log.i("Number of Font Faces : ", faceProps.length);
    foreach (prop; faceProps) {
        try {
            faces ~= to!dstring(prop.face);
        }
        catch (UTFException e) {
            faces ~= "-----"d;
        }
    }
    faces.sort();

    listAdapter.clear();
    foreach (face; faces) {
        if (filter && filter.length && indexOf(face, filter) < 0)
            continue;
        listAdapter.add(face);
    }
}