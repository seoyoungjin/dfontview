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
    auto canvas = new CanvasWidget("Canvas");
    canvas.onDrawListener = delegate(CanvasWidget canvas, DrawBuf buf, Rect rc) {
        dstring text = "안녕하세요 CanvasWidget"d;
        FontRef font = FontManager.instance.getFont(25, FontWeight.Normal,
            false, FontFamily.SansSerif, "D2Coding");
        Point sz = font.textSize(text);
        canvas.applyAlign(rc, sz, Align.HCenter, Align.VCenter);
        font.drawText(buf, rc.left, rc.top, text, canvas.textColor, 4, 0, canvas.textFlags);
    };
    window.mainWidget = canvas;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
