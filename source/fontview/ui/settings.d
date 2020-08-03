module fontview.ui.settings;

import dlangui.core.settings;
import dlangui.core.i18n;
import dlangui.graphics.fonts;
import dlangui.dialogs.settingsdialog;

class FontViewSettings : SettingsFile {
    this(string filename) {
        super(filename);
    }

    override void updateDefaults() {
        Setting ui = uiSettings();
        ui.setStringDef("theme", "theme_default");
        ui.setStringDef("language", "en");

        // freetype settings
        Setting ft = ftSettings();
        ft.setIntegerDef("hintingMode", 1);
        ft.setIntegerDef("minAntialiasedFontSize", 0);
        ft.setFloatingDef("fontGamma", 0.8);
    }

    @property Setting uiSettings() { return _setting.objectByPath("interface", true); }
    @property string uiLanguage() { return uiSettings.getString("language", "en"); }
    @property string uiTheme() { return uiSettings.getString("theme", "theme_custom"); }

    @property Setting ftSettings() { return _setting.objectByPath("freetype", true); }
    @property double fontGamma() {
        double gamma = ftSettings.getFloating("fontGamma", 1.0);
        if (gamma >= 0.5 && gamma <= 2.0)
            return gamma;
        return 1.0;
    }
    @property HintingMode hintingMode() {
        long mode = ftSettings.getInteger("hintingMode", HintingMode.Normal);
        if (mode >= HintingMode.Normal && mode <= HintingMode.Light)
            return cast(HintingMode)mode;
        return HintingMode.Normal;
    }
    @property int minAntialiasedFontSize() {
        long sz = ftSettings.getInteger("minAntialiasedFontSize", 0);
        if (sz >= 0)
            return cast(int)sz;
        return 0;
    }
}

/// create settings pages tree
SettingsPage createSettingsPages() {
    // Root page
    SettingsPage res = new SettingsPage("", UIString.fromRaw(""d));

    // UI settings page
    SettingsPage ui = res.addChild("interface", UIString.fromRaw("Interface"d));
    ui.addStringComboBox("interface/theme", UIString.fromRaw("Theme"d), [
            StringListValue("theme_default", "Default"d), 
            StringListValue("theme_custom", "Custom"d)
        ]);
    ui.addStringComboBox("interface/language", UIString.fromRaw("Language"d), [
            StringListValue("en", "English"d), 
            StringListValue("ko", "Korean"d)
        ]);

    // font
    SettingsPage freetype = res.addChild("freetype", UIString.fromRaw("Freetype"d));
    freetype.addIntComboBox("freetype/hintingMode", UIString.fromRaw("Hinting Mode"d), [
            StringListValue(0, "Normal"d), 
            StringListValue(1, "Force"d), 
            StringListValue(2, "Disabled"d), 
            StringListValue(3, "Light"d)
        ]);
    freetype.addIntComboBox("freetype/minAntialiasedFontSize", UIString.fromRaw("Font Antialiasing"c),
            [StringListValue(0, "Always On"d),
            StringListValue(12, "12"d),
            StringListValue(14, "14"d),
            StringListValue(16, "16"d),
            StringListValue(20, "20"d),
            StringListValue(24, "24"d),
            StringListValue(32, "32"d),
            StringListValue(48, "48"d),
            StringListValue(255, "ALways Off"d)]);
    freetype.addFloatComboBox("freetype/fontGamma", UIString.fromRaw("Font Gamma"d), [
            StringListValue(500,  "0.5   "d),
            StringListValue(600,  "0.6   "d),
            StringListValue(700,  "0.7   "d),
            StringListValue(800,  "0.8   "d),
            StringListValue(850,  "0.85  "d),
            StringListValue(900,  "0.9   "d),
            StringListValue(950,  "0.95  "d),
            StringListValue(1000, "1.0   "d),
            StringListValue(1050, "1.05  "d),
            StringListValue(1100, "1.1   "d),
            StringListValue(1150, "1.15  "d),
            StringListValue(1200, "1.2   "d),
            StringListValue(1250, "1.25  "d),
            StringListValue(1300, "1.3   "d),
            StringListValue(1400, "1.4   "d),
            StringListValue(1500, "1.5   "d),
            StringListValue(1700, "1.7   "d),
            StringListValue(2000, "2.0   "d)
        ]);

    return res;
}