import dlangui;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) 
{
    Platform.instance.uiLanguage="en";
    Platform.instance.uiTheme="theme_default";

    // create window
    Window window = Platform.instance.createWindow("D FontView", null);
    auto button = new Button;
    button.text = "D言語くん可愛い";
    window.mainWidget = button;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}