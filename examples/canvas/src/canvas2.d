import dlangui;
import dlangui.graphics.fonts;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args)
{
    Platform.instance.uiLanguage="en";
    Platform.instance.uiTheme="theme_default";

    // create window
    Window window = Platform.instance.createWindow("D Canvas Sample", null);
    auto canvas = new MyCanvasWidget;
    window.mainWidget = canvas;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}

class MyCanvasWidget : CanvasWidget
{
    this() { }

    protected void drawText(DrawBuf buf, Rect rc, dstring text) {
        // FontRef font = font();
        FontRef font = FontManager.instance.getFont(25, FontWeight.Normal,
            false, FontFamily.SansSerif, "D2Coding");
        Point sz = font.textSize(text);
        applyAlign(rc, sz, Align.HCenter, Align.VCenter);
        font.drawText(buf, rc.left, rc.top, text, textColor, 4, 0, textFlags);
    }

    override void doDraw(DrawBuf buf, Rect rc) {
        dstring sampleText = "안녕하세요 MyCanvasWidget"d;
        drawText(buf,rc, sampleText);
    }
}
