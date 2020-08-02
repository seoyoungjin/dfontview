module fontview.ui.settings;

import dlangui.core.settings;

class FontViewSettings : SettingsFile {
    this(string filename) {
        super(filename);
    }

    FontViewSettings clone() {
        FontViewSettings res = new FontViewSettings(filename);
        res.applySettings(setting);
        return res;
    }

    override void updateDefaults() {
        uiSettings.setStringDef("lang", "en");
        uiSettings.setStringDef("theme", "theme_custom");

        // freetype settings
        ftSettings.setStringDef("hintingMode", "normal");
        ftSettings.setStringDef("fontGamma", "0.8");
    }

    @property Setting uiSettings() { return _setting.objectByPath("ui", true); }
    @property string lang() { return uiSettings.getString("lang", "en"); }
    @property string theme() { return uiSettings.getString("theme", "theme_custom"); }

    @property Setting ftSettings() { return _setting.objectByPath("freetype", true); }
    @property string hingtingMode() { return ftSettings.getString("hintingMode", "normal"); }
    @property string fontGamma() { return ftSettings.getString("fontGamma", "0.8"); }
}