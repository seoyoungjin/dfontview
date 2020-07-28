import std.stdio;
import std.string;

import dlangui;
import fontview.ui.appdata;
import fontview.ui.frame;
import fontview.ui.pangram;
import fontview.ui.property;
import fontview.ui.charmap;

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

    // create font list and filter
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

    // create tabs
    TabWidget tabs = new TabWidget("Tabs");
    tabs.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);

    auto pangram = new Pangram("pangram");
    auto charmap = new UnicodeMap("charmap");
    auto property = new FontProperty("property");

    tabs.addTab(pangram, "Pangram"d);
    tabs.addTab(charmap, "Unicode"d);
    tabs.addTab(property, "Property"d);
    tabs.selectTab("pangram");

    frame.frameBody.addChild(left);
    frame.frameBody.addChild(tabs);
    frame.statusLine.setStatusText(format("%d font faces"d, fontList.itemCount));

    fontList.itemSelected = delegate(Widget source, int index) {
        ListWidget fontList = cast(ListWidget)source;
        appData.fontFace = to!string(fontList.itemWidget(index).text);
        return true;
    };
    fontList.selectItem(0);
    fontList.itemSelected.emit(fontList, 0);

    window.mainWidget = frame;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

void updateFontList(StringListAdapter listAdapter, dstring filter = null)
{
    dstring[] faces = appData.getFontFaces();

    listAdapter.clear();
    foreach (face; faces) {
        if (filter && filter.length && indexOf(face, filter) < 0)
            continue;
        listAdapter.add(face);
    }
}