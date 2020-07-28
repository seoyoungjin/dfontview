module fontview.ui.property;

import std.stdio;
import std.string;
import std.conv : to;
import std.utf;

import dlangui;


class FontProperty : VerticalLayout
{
    dstring face;
    TextWidget italic, bold, fixed, emsize;
    TextWidget font_file;

    this(string id) {
        super(id);
        fillParent();

        italic = new TextWidget();
        bold = new TextWidget();
        fixed = new TextWidget();
        emsize = new TextWidget();
        font_file = new TextWidget();
        addChildren([italic, bold, fixed, emsize, font_file]);
        setFace(""d);
    }

    void setFace(dstring f) {
        face = f;
        italic.text = "Italic : true"d;
        bold.text = "Bold : true"d;
        fixed.text = "Fixed : true"d;
        emsize.text = "Emsize : 10"d;
        font_file.text = "NAME.TTF"d;
    }
}
