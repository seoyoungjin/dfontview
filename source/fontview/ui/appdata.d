module fontview.ui.appdata;

import std.algorithm;
import std.conv : to;
import std.utf;

import dlangui;

class AppData {
    string fontFace;
    dstring[] faces;
    dstring userText;

    // get sorted font list
    dstring[] getFontFaces()
    {
        if (faces == null) {
            FontFaceProps[] faceProps = FontManager.instance.getFaces();
            Log.i("Number of Font Faces : ", faceProps.length);
            foreach (prop; faceProps) {
                try {
                    faces ~= to!dstring(prop.face);
                }
                catch (UTFException e) {
                    faces ~= "-----"d;
                }
            }
            faces.sort();
        }
        return faces;
    }
};

AppData appData;

static this()
{
    appData = new AppData();
}
