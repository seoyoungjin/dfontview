module fontview.ui.appdata;

import std.algorithm;
import std.conv : to;
import std.utf;

import dlangui.graphics.fonts;

class AppData {
    // text to draw in pangram
    const dstring pangramText   = "The quick brown fox jumps over the lazy dog. 1234567890"d;
    const dstring pangramTextKo = "다람쥐 헌 쳇바퀴에 타고파. 1234567890"d;
    dstring userText;

    dstring text() {
        if (userText.length > 0)
            return userText;
        return pangramText;
    }

    FontWeight weight = FontWeight.Normal;
    bool italic = false;
    string fontFace;
    dstring[] faces;

    // get sorted font list
    dstring[] getFontFaces() {
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

    // unicode map - this may be slice of array LATER
    int[4096] unicodeMap;

    void genUnicodeMap() {
        for (int i = 0 ; i < 4096; ++i) {
            unicodeMap[i] = i * 16;
        }
    }

    int unicodeMapIndex(int code) {
        return code >> 4;
    }
};

AppData appData;

static this()
{
    appData = new AppData();
}
