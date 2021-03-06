import std.stdio;
import std.string;
import std.typecons : No;

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
            WindowFlag.Resizable, 700, 600);

    auto frame = new FontViewFrame();

    // create font list and filter
    auto left = new VerticalLayout().layoutWidth(200).layoutHeight(FILL_PARENT);
    auto fontFilter = new EditLine("fontFilter");
    fontFilter.margins(Rect(5,5,5,5));

    auto fontList = new StringListWidget("fontList");
    auto listAdapter = new StringListAdapter();
    fontList.ownAdapter = listAdapter;
    updateFontList(fontList);

    // listeners
    fontFilter.contentChange = delegate (EditableContent source) {
        updateFontList(fontList, source.text);
    };

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
        assert(charmap.childCount() && charmap.childById("GRID1"));
        charmap.childById("GRID1").fontFace = appData.fontFace;
        return true;
    };
    fontList.selectItem(0);
    fontList.itemSelected.emit(fontList, 0);

    tabs.tabChanged = delegate(string newTabId, string prevTabId) {
        if (newTabId is "pangram") {
            frame.toolbars.childById("action-bold").enabled = true;
            frame.toolbars.childById("action-italic").enabled = true;
        }
        else {
            frame.toolbars.childById("action-bold").enabled = false;
            frame.toolbars.childById("action-italic").enabled = false;
        }
    };

    window.mainWidget = frame;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

void updateFontList(StringListWidget w, dstring filter = null)
{
    auto adapter = cast(StringListAdapter) w.adapter;
    dstring[] faces = appData.getFontFaces();

    adapter.clear();
    foreach (face; faces) {
        if (filter && indexOf(face, filter, No.caseSensitive) < 0)
            continue;
        adapter.add(face);
    }
    // range error
    w.selectedItemIndex(-1);
}
