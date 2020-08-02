module fontview.ui.property;

import std.format;
import fontview.ui.appdata;

import dlangui;

class FontProperty : VerticalLayout
{
    TextWidget face;
    TextWidget italic, bold, fixed;
    // TextWidget font_file;

    this(string id) {
        super(id);
        fillParent();
        padding(5.pointsToPixels);

        face = new TextWidget();
        face.layoutHeight = 24;
        italic = new TextWidget();
        bold = new TextWidget();
        fixed = new TextWidget();
        // font_file = new TextWidget();

        addChild(face);
        addChildren([bold, italic, fixed]);
    }

    /// Draw widget at its position to buffer
    override void onDraw(DrawBuf buf) {
        face.fontFace = appData.fontFace;
        face.fontSize = 18;
        FontRef fnt = face.font();

        face.text = to!dstring(appData.fontFace);
        if (fnt.weight == FontWeight.Normal)
            bold.text = "Weight : Normal"d;
        else
            bold.text = "Bold : Bold"d;
        italic.text = format("Italic : %s"d, fnt.italic);
        fixed.text = format("Fixed : %s"d, fnt.isFixed);

        // font_file.text = "NAME.TTF"d;
        super.onDraw(buf);
    }
}
