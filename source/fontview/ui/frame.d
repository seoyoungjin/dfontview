module fontview.ui.frame;

import dlangui.widgets.widget;
import dlangui.widgets.menu;
import dlangui.widgets.tabs;
import dlangui.widgets.appframe;
import dlangui.widgets.docks;
import dlangui.widgets.layouts;
import dlangui.widgets.toolbars;

// action codes
enum Actions : int {
    BrowseView = 10000,
    ListView,
    GridView,
    HelpAbout,
}

// actions
// const Action ACTION_BROWSE_VIEW = new Action(Actions.BrowseView, "Browse"d, "browseview"c);
const Action ACTION_VIEW_LIST = new Action(Actions.ListView, "List View"d, "view-list"c);
const Action ACTION_VIEW_GRID = new Action(Actions.GridView, "Grid View"d, "view-grid"c);

const Action ACTION_HELP_ABOUT = new Action(Actions.HelpAbout, "About"d, "about"c, KeyCode.F1, 0);

class FontViewFrame : AppFrame
{
    /// create app body widget
    override protected Widget createBody() {
        auto bodyWidget = new HorizontalLayout();
        bodyWidget.layoutWidth = FILL_PARENT;
        bodyWidget.layoutHeight = FILL_PARENT;
        return bodyWidget;
    }


    /// create app toolbars
    override protected ToolBarHost createToolbars() {
        ToolBarHost res = new ToolBarHost();
        ToolBar tb = res.getOrAddToolbar("Standard");
        tb.addButtons(
                      // ACTION_VIEW_,
                      ACTION_VIEW_LIST,
                      ACTION_VIEW_GRID,
                      ACTION_HELP_ABOUT);
        return res;
    }
}
