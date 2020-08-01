module fontview.ui.frame;

import dlangui.widgets.widget;
import dlangui.widgets.menu;
import dlangui.widgets.tabs;
import dlangui.widgets.appframe;
import dlangui.widgets.docks;
import dlangui.widgets.layouts;
import dlangui.widgets.toolbars;
import dlangui.widgets.controls;

// action codes
enum Actions : int {
    BrowseView = 10000,
    ListView,
    GridView,
    HelpAbout,
    Bold,
    Italic,
    Settings
}

// actions
const Action ACTION_BOLD = new Action(Actions.Bold, "Bold"d, "bold-icon"c);
const Action ACTION_ITALIC = new Action(Actions.Italic, "Italic"d, "italic-icon"c);
const Action ACTION_SETTINGS = new Action(Actions.Settings, "Settings"d, "settings"c);
// const Action ACTION_BROWSE_VIEW = new Action(Actions.BrowseView, "Browse"d, "browseview"c);
// const Action ACTION_VIEW_LIST = new Action(Actions.ListView, "List View"d, "view-list"c);
// const Action ACTION_VIEW_GRID = new Action(Actions.GridView, "Grid View"d, "view-grid"c);
// const Action ACTION_HELP_ABOUT = new Action(Actions.HelpAbout, "About"d, "about"c, KeyCode.F1, 0);

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

        auto btnBold = new ToolBarImageCheckButton(ACTION_BOLD);
        tb.addChild(btnBold);
        auto btnItalic = new ToolBarImageCheckButton(ACTION_ITALIC);
        tb.addChild(btnItalic);
        tb.addButtons(ACTION_SEPARATOR);

        tb.addButtons(ACTION_SETTINGS);
                      // ACTION_VIEW_,
                      // ACTION_VIEW_LIST,
                      // ACTION_VIEW_GRID,
        return res;
    }

    /// override to handle specific actions state (e.g. change enabled state for supported actions)
    override bool handleActionStateRequest(const Action a) {
        switch (a.id) {
        case Actions.Bold:
            auto w = toolbars.child(0);
            // w.checked = true;
            return true;
        case Actions.Italic:
            return true;
        case Actions.Settings:
            a.state = ACTION_STATE_ENABLED;
            return true;
        default:
            return super.handleActionStateRequest(a);
        }
    }
}

/// image check button for toolbar
class ToolBarImageCheckButton : ImageCheckButton {
    this(const Action a) {
        super(a);
        styleId = STYLE_TOOLBAR_BUTTON;
        focusable = false;
    }
    mixin ActionTooltipSupport;
}