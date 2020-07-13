import std.stdio;

import dlangui;
import dlangui.graphics.fonts;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) 
{
    FontFaceProps[] faces = FontManager.instance.getFaces();
    writeln("Total fonts: ", faces.length);
    for (auto i = 0; i < faces.length; ++i) {
        writeln(i, " ", faces[i].face, " ", faces[i].family);
    }
    
    return 0;
}

