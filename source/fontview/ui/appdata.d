module fontview.ui.appdata;

import std.algorithm;
import std.conv : to;
import std.utf;

import dlangui;

class AppData {
    const dstring pangramText   = "The quick brown fox jumps over the lazy dog. 1234567890"d;
    const dstring pangramTextKo = "다람쥐 헌 쳇바퀴에 타고파. 1234567890"d;
    dstring userText;

    dstring text()
    {
        if (userText.length > 0)
            return userText;
        return pangramText;
    }

    string fontFace;
    dstring[] faces;

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
