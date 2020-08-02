module fontview.ui.frame;

import std.path;

import dlangui.core.stdaction;
import dlangui.dialogs.dialog;
import dlangui.widgets.appframe;
import dlangui.widgets.widget;
import dlangui.widgets.tabs;
import dlangui.widgets.layouts;
import dlangui.widgets.toolbars;
import dlangui.widgets.controls;

import fontview.ui.appdata;
import fontview.ui.settings;
import fontview.ui.settingsdlg;

// action codes
enum Actions : int {
    BrowseView = 10000,
    ListView,
    GridView,
    Bold,
    Italic,
    Settings,
    HelpAbout
}

// actions
const Action ACTION_BOLD = new Action(Actions.Bold, "Bold"d, "bold-icon"c);
const Action ACTION_ITALIC = new Action(Actions.Italic, "Italic"d, "italic-icon"c);
const Action ACTION_SETTINGS = new Action(Actions.Settings, "Settings"d, "setting"c);
// const Action ACTION_BROWSE_VIEW = new Action(Actions.BrowseView, "Browse"d, "browseview"c);
// const Action ACTION_VIEW_LIST = new Action(Actions.ListView, "List View"d, "view-list"c);
// const Action ACTION_VIEW_GRID = new Action(Actions.GridView, "Grid View"d, "view-grid"c);
// const Action ACTION_HELP_ABOUT = new Action(Actions.HelpAbout, "About"d, "about"c, KeyCode.F1, 0);

class FontViewFrame : AppFrame
{
    FontViewSettings _settings; 

    override protected void initialize() {
        _settings = new FontViewSettings(buildNormalizedPath(settingsDir, "settings.json"));
        _settings.load();
        _settings.updateDefaults();
        _settings.save();
        super.initialize();
    }

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
        ToolBar tb = res.getOrAddToolbar("Pangram");

        auto btnBold = new ToolBarImageCheckButton(ACTION_BOLD).id("action-bold");
        auto btnItalic = new ToolBarImageCheckButton(ACTION_ITALIC).id("action-italic");
        tb.addControl(btnBold);
        tb.addControl(btnItalic);
        tb.addButtons(ACTION_SEPARATOR);

        tb.addButtons(ACTION_SETTINGS);

        return res;
    }

    /// override to handle specific actions
    override bool handleAction(const Action a) {
        switch (a.id) {
        case Actions.Bold:
            auto w = toolbars.childById("action-bold");
            if (w.checked == true)
                appData.weight = FontWeight.Bold;
            else
                appData.weight = FontWeight.Normal;
            return true;
        case Actions.Italic:
            auto w = toolbars.childById("action-italic");
            appData.italic = (w.checked == true);
            return true;
        case Actions.Settings:
            showPreferences();
            return true;
        default:
            return super.handleAction(a);
        }
    }

    void showPreferences() {
        FontViewSettings s = _settings.clone();
        SettingsDialog dlg = new SettingsDialog(this, s);
        dlg.dialogResult = delegate(Dialog dlg, const Action result) {
            if (result.id == ACTION_APPLY.id) {
                _settings.applySettings(s.setting);
                _settings.save();
            }
        };
        dlg.show();
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