module unicode_tables;

struct UnicodeProperty
{
    string name;
    ubyte[] compressed;
}

struct blocks
{
private alias _U = immutable(UnicodeProperty);
@property static _U[] tab() pure { return _tab; }
static immutable:
private alias _T = ubyte[];
_T Number_Forms = [0xa0, 0x21, 0x50, 0x40];
_T Sinhala = [0x8d, 0x80, 0x80, 0x80];
_T Domino_Tiles = [0xa1, 0xf0, 0x30, 0x70];
_T Oriya = [0x8b, 0x0, 0x80, 0x80];
_T Thaana = [0x87, 0x80, 0x40];
_T New_Tai_Lue = [0x99, 0x80, 0x60];
_T Byzantine_Musical_Symbols = [0xa1, 0xd0, 0x0, 0x81, 0x0];
_T Cham = [0xa0, 0xaa, 0x0, 0x60];
_T IPA_Extensions = [0x82, 0x50, 0x60];
_T Bopomofo = [0xa0, 0x31, 0x0, 0x30];
_T Katakana_Phonetic_Extensions = [0xa0, 0x31, 0xf0, 0x10];
_T Khmer_Symbols = [0x99, 0xe0, 0x20];
_T Hebrew = [0x85, 0x90, 0x70];
_T Saurashtra = [0xa0, 0xa8, 0x80, 0x60];
_T Inscriptional_Parthian = [0xa1, 0xb, 0x40, 0x20];
_T Lisu = [0xa0, 0xa4, 0xd0, 0x30];
_T Latin_1_Supplement = [0x80, 0x80, 0x80, 0x80];
_T Arabic_Extended_A = [0x88, 0xa0, 0x60];
_T Tai_Tham = [0x9a, 0x20, 0x80, 0x90];
_T Latin_Extended_A = [0x81, 0x0, 0x80, 0x80];
_T Latin_Extended_B = [0x81, 0x80, 0x80, 0xd0];
_T Latin_Extended_C = [0xa0, 0x2c, 0x60, 0x20];
_T Latin_Extended_D = [0xa0, 0xa7, 0x20, 0x80, 0xe0];
_T CJK_Radicals_Supplement = [0xa0, 0x2e, 0x80, 0x80, 0x80];
_T Meroitic_Hieroglyphs = [0xa1, 0x9, 0x80, 0x20];
_T Linear_B_Syllabary = [0xa1, 0x0, 0x0, 0x80, 0x80];
_T Phonetic_Extensions_Supplement = [0x9d, 0x80, 0x40];
_T Meroitic_Cursive = [0xa1, 0x9, 0xa0, 0x60];
_T Enclosed_Ideographic_Supplement = [0xa1, 0xf2, 0x0, 0x81, 0x0];
_T Halfwidth_and_Fullwidth_Forms = [0xa0, 0xff, 0x0, 0x80, 0xf0];
_T Takri = [0xa1, 0x16, 0x80, 0x50];
_T Supplemental_Punctuation = [0xa0, 0x2e, 0x0, 0x80, 0x80];
_T Malayalam = [0x8d, 0x0, 0x80, 0x80];
_T Lepcha = [0x9c, 0x0, 0x50];
_T Miscellaneous_Symbols_And_Pictographs = [0xa1, 0xf3, 0x0, 0x83, 0x0];
_T Arabic_Presentation_Forms_A = [0xa0, 0xfb, 0x50, 0x82, 0xb0];
_T Sora_Sompeng = [0xa1, 0x10, 0xd0, 0x30];
_T Lydian = [0xa1, 0x9, 0x20, 0x20];
_T Hangul_Jamo_Extended_B = [0xa0, 0xd7, 0xb0, 0x50];
_T Private_Use_Area = [0xa0, 0xe0, 0x0, 0x99, 0x0];
_T Coptic = [0xa0, 0x2c, 0x80, 0x80, 0x80];
_T Phaistos_Disc = [0xa1, 0x1, 0xd0, 0x30];
_T Batak = [0x9b, 0xc0, 0x40];
_T Khmer = [0x97, 0x80, 0x80, 0x80];
_T Counting_Rod_Numerals = [0xa1, 0xd3, 0x60, 0x20];
_T Old_South_Arabian = [0xa1, 0xa, 0x60, 0x20];
_T Kannada = [0x8c, 0x80, 0x80, 0x80];
_T Arrows = [0xa0, 0x21, 0x90, 0x70];
_T CJK_Compatibility_Ideographs_Supplement = [0xa2, 0xf8, 0x0, 0x82, 0x20];
_T Combining_Half_Marks = [0xa0, 0xfe, 0x20, 0x10];
_T Miscellaneous_Technical = [0xa0, 0x23, 0x0, 0x81, 0x0];
_T Thai = [0x8e, 0x0, 0x80, 0x80];
_T Alphabetic_Presentation_Forms = [0xa0, 0xfb, 0x0, 0x50];
_T CJK_Unified_Ideographs = [0xa0, 0x4e, 0x0, 0xa0, 0x52, 0x0];
_T Phonetic_Extensions = [0x9d, 0x0, 0x80, 0x80];
_T Kayah_Li = [0xa0, 0xa9, 0x0, 0x30];
_T Supplementary_Private_Use_Area_B = [0xb0, 0x0, 0x0];
_T Gujarati = [0x8a, 0x80, 0x80, 0x80];
_T Unified_Canadian_Aboriginal_Syllabics_Extended = [0x98, 0xb0, 0x50];
_T Hangul_Syllables = [0xa0, 0xac, 0x0, 0xa0, 0x2b, 0xb0];
_T Vertical_Forms = [0xa0, 0xfe, 0x10, 0x10];
_T Inscriptional_Pahlavi = [0xa1, 0xb, 0x60, 0x20];
_T Control_Pictures = [0xa0, 0x24, 0x0, 0x40];
_T Carian = [0xa1, 0x2, 0xa0, 0x40];
_T Mahjong_Tiles = [0xa1, 0xf0, 0x0, 0x30];
_T Geometric_Shapes = [0xa0, 0x25, 0xa0, 0x60];
_T Cherokee = [0x93, 0xa0, 0x60];
_T Imperial_Aramaic = [0xa1, 0x8, 0x40, 0x20];
_T Rumi_Numeral_Symbols = [0xa1, 0xe, 0x60, 0x20];
_T Combining_Diacritical_Marks = [0x83, 0x0, 0x70];
_T Specials = [0xa0, 0xff, 0xf0, 0x10];
_T Greek_Extended = [0x9f, 0x0, 0x81, 0x0];
_T Ethiopic_Supplement = [0x93, 0x80, 0x20];
_T Limbu = [0x99, 0x0, 0x50];
_T Basic_Latin = [0x0, 0x80, 0x80];
_T Enclosed_Alphanumeric_Supplement = [0xa1, 0xf1, 0x0, 0x81, 0x0];
_T Cyrillic_Supplement = [0x85, 0x0, 0x30];
_T Hangul_Compatibility_Jamo = [0xa0, 0x31, 0x30, 0x60];
_T Supplemental_Arrows_A = [0xa0, 0x27, 0xf0, 0x10];
_T Supplemental_Arrows_B = [0xa0, 0x29, 0x0, 0x80, 0x80];
_T Katakana = [0xa0, 0x30, 0xa0, 0x60];
_T Ancient_Greek_Musical_Notation = [0xa1, 0xd2, 0x0, 0x50];
_T CJK_Compatibility = [0xa0, 0x33, 0x0, 0x81, 0x0];
_T Old_Persian = [0xa1, 0x3, 0xa0, 0x40];
_T Small_Form_Variants = [0xa0, 0xfe, 0x50, 0x20];
_T General_Punctuation = [0xa0, 0x20, 0x0, 0x70];
_T Miscellaneous_Mathematical_Symbols_A = [0xa0, 0x27, 0xc0, 0x30];
_T Latin_Extended_Additional = [0x9e, 0x0, 0x81, 0x0];
_T Playing_Cards = [0xa1, 0xf0, 0xa0, 0x60];
_T Syriac = [0x87, 0x0, 0x50];
_T Alchemical_Symbols = [0xa1, 0xf7, 0x0, 0x80, 0x80];
_T Tibetan = [0x8f, 0x0, 0x81, 0x0];
_T CJK_Strokes = [0xa0, 0x31, 0xc0, 0x30];
_T Tamil = [0x8b, 0x80, 0x80, 0x80];
_T Balinese = [0x9b, 0x0, 0x80, 0x80];
_T Shavian = [0xa1, 0x4, 0x50, 0x30];
_T Greek_and_Coptic = [0x83, 0x70, 0x80, 0x90];
_T Telugu = [0x8c, 0x0, 0x80, 0x80];
_T Runic = [0x96, 0xa0, 0x60];
_T Javanese = [0xa0, 0xa9, 0x80, 0x60];
_T Bopomofo_Extended = [0xa0, 0x31, 0xa0, 0x20];
_T Ideographic_Description_Characters = [0xa0, 0x2f, 0xf0, 0x10];
_T Old_Turkic = [0xa1, 0xc, 0x0, 0x50];
_T Unified_Canadian_Aboriginal_Syllabics = [0x94, 0x0, 0x82, 0x80];
_T Ugaritic = [0xa1, 0x3, 0x80, 0x20];
_T Egyptian_Hieroglyphs = [0xa1, 0x30, 0x0, 0x84, 0x30];
_T Buginese = [0x9a, 0x0, 0x20];
_T Kangxi_Radicals = [0xa0, 0x2f, 0x0, 0x80, 0xe0];
_T Cuneiform = [0xa1, 0x20, 0x0, 0x84, 0x0];
_T NKo = [0x87, 0xc0, 0x40];
_T Sundanese_Supplement = [0x9c, 0xc0, 0x10];
_T Buhid = [0x97, 0x40, 0x20];
_T Modifier_Tone_Letters = [0xa0, 0xa7, 0x0, 0x20];
_T Kanbun = [0xa0, 0x31, 0x90, 0x10];
_T Superscripts_and_Subscripts = [0xa0, 0x20, 0x70, 0x30];
_T Lao = [0x8e, 0x80, 0x80, 0x80];
_T Ol_Chiki = [0x9c, 0x50, 0x30];
_T Common_Indic_Number_Forms = [0xa0, 0xa8, 0x30, 0x10];
_T Hangul_Jamo_Extended_A = [0xa0, 0xa9, 0x60, 0x20];
_T Arabic_Presentation_Forms_B = [0xa0, 0xfe, 0x70, 0x80, 0x90];
_T Sharada = [0xa1, 0x11, 0x80, 0x60];
_T Miscellaneous_Symbols = [0xa0, 0x26, 0x0, 0x81, 0x0];
_T Variation_Selectors_Supplement = [0xae, 0x1, 0x0, 0x80, 0xf0];
_T Rejang = [0xa0, 0xa9, 0x30, 0x30];
_T Georgian_Supplement = [0xa0, 0x2d, 0x0, 0x30];
_T Braille_Patterns = [0xa0, 0x28, 0x0, 0x81, 0x0];
_T Lycian = [0xa1, 0x2, 0x80, 0x20];
_T Tai_Le = [0x99, 0x50, 0x30];
_T Miscellaneous_Mathematical_Symbols_B = [0xa0, 0x29, 0x80, 0x80, 0x80];
_T Musical_Symbols = [0xa1, 0xd1, 0x0, 0x81, 0x0];
_T Avestan = [0xa1, 0xb, 0x0, 0x40];
_T Ethiopic = [0x92, 0x0, 0x81, 0x80];
_T Arabic_Supplement = [0x87, 0x50, 0x30];
_T Samaritan = [0x88, 0x0, 0x40];
_T Cuneiform_Numbers_and_Punctuation = [0xa1, 0x24, 0x0, 0x80, 0x80];
_T Mongolian = [0x98, 0x0, 0x80, 0xb0];
_T Arabic = [0x86, 0x0, 0x81, 0x0];
_T Vai = [0xa0, 0xa5, 0x0, 0x81, 0x40];
_T Tifinagh = [0xa0, 0x2d, 0x30, 0x50];
_T Bamum_Supplement = [0xa1, 0x68, 0x0, 0x82, 0x40];
_T Tai_Viet = [0xa0, 0xaa, 0x80, 0x60];
_T Mandaic = [0x88, 0x40, 0x20];
_T Sundanese = [0x9b, 0x80, 0x40];
_T Block_Elements = [0xa0, 0x25, 0x80, 0x20];
_T Phoenician = [0xa1, 0x9, 0x0, 0x20];
_T Hanunoo = [0x97, 0x20, 0x20];
_T Supplemental_Mathematical_Operators = [0xa0, 0x2a, 0x0, 0x81, 0x0];
_T Deseret = [0xa1, 0x4, 0x0, 0x50];
_T Brahmi = [0xa1, 0x10, 0x0, 0x80, 0x80];
_T Devanagari_Extended = [0xa0, 0xa8, 0xe0, 0x20];
_T Supplementary_Private_Use_Area_A = [0xaf, 0x0, 0x0, 0xa1, 0x0, 0x0];
_T Box_Drawing = [0xa0, 0x25, 0x0, 0x80, 0x80];
_T Mathematical_Operators = [0xa0, 0x22, 0x0, 0x81, 0x0];
_T Ogham = [0x96, 0x80, 0x20];
_T Meetei_Mayek_Extensions = [0xa0, 0xaa, 0xe0, 0x20];
_T Hangul_Jamo = [0x91, 0x0, 0x81, 0x0];
_T Miao = [0xa1, 0x6f, 0x0, 0x80, 0xa0];
_T Emoticons = [0xa1, 0xf6, 0x0, 0x50];
_T Tags = [0xae, 0x0, 0x0, 0x80, 0x80];
_T Yi_Syllables = [0xa0, 0xa0, 0x0, 0x84, 0x90];
_T Gurmukhi = [0x8a, 0x0, 0x80, 0x80];
_T Syloti_Nagri = [0xa0, 0xa8, 0x0, 0x30];
_T Spacing_Modifier_Letters = [0x82, 0xb0, 0x50];
_T Yi_Radicals = [0xa0, 0xa4, 0x90, 0x40];
_T Ancient_Greek_Numbers = [0xa1, 0x1, 0x40, 0x50];
_T Glagolitic = [0xa0, 0x2c, 0x0, 0x60];
_T Georgian = [0x90, 0xa0, 0x60];
_T Osmanya = [0xa1, 0x4, 0x80, 0x30];
_T Variation_Selectors = [0xa0, 0xfe, 0x0, 0x10];
_T Mathematical_Alphanumeric_Symbols = [0xa1, 0xd4, 0x0, 0x84, 0x0];
_T Yijing_Hexagram_Symbols = [0xa0, 0x4d, 0xc0, 0x40];
_T Ethiopic_Extended = [0xa0, 0x2d, 0x80, 0x60];
_T Transport_And_Map_Symbols = [0xa1, 0xf6, 0x80, 0x80, 0x80];
_T High_Private_Use_Surrogates = [0xa0, 0xdb, 0x80, 0x80, 0x80];
_T Meetei_Mayek = [0xa0, 0xab, 0xc0, 0x40];
_T CJK_Compatibility_Forms = [0xa0, 0xfe, 0x30, 0x20];
_T Enclosed_Alphanumerics = [0xa0, 0x24, 0x60, 0x80, 0xa0];
_T Ancient_Symbols = [0xa1, 0x1, 0x90, 0x40];
_T Ethiopic_Extended_A = [0xa0, 0xab, 0x0, 0x30];
_T Bengali = [0x89, 0x80, 0x80, 0x80];
_T Currency_Symbols = [0xa0, 0x20, 0xa0, 0x30];
_T Myanmar = [0x90, 0x0, 0x80, 0xa0];
_T Cyrillic_Extended_A = [0xa0, 0x2d, 0xe0, 0x20];
_T Cyrillic_Extended_B = [0xa0, 0xa6, 0x40, 0x60];
_T Myanmar_Extended_A = [0xa0, 0xaa, 0x60, 0x20];
_T Hiragana = [0xa0, 0x30, 0x40, 0x60];
_T Dingbats = [0xa0, 0x27, 0x0, 0x80, 0xc0];
_T Armenian = [0x85, 0x30, 0x60];
_T Tai_Xuan_Jing_Symbols = [0xa1, 0xd3, 0x0, 0x60];
_T Linear_B_Ideograms = [0xa1, 0x0, 0x80, 0x80, 0x80];
_T Kharoshthi = [0xa1, 0xa, 0x0, 0x60];
_T Optical_Character_Recognition = [0xa0, 0x24, 0x40, 0x20];
_T Enclosed_CJK_Letters_and_Months = [0xa0, 0x32, 0x0, 0x81, 0x0];
_T Cypriot_Syllabary = [0xa1, 0x8, 0x0, 0x40];
_T Vedic_Extensions = [0x9c, 0xd0, 0x30];
_T Kaithi = [0xa1, 0x10, 0x80, 0x50];
_T Low_Surrogates = [0xa0, 0xdc, 0x0, 0x84, 0x0];
_T Letterlike_Symbols = [0xa0, 0x21, 0x0, 0x50];
_T Combining_Diacritical_Marks_for_Symbols = [0xa0, 0x20, 0xd0, 0x30];
_T Aegean_Numbers = [0xa1, 0x1, 0x0, 0x40];
_T High_Surrogates = [0xa0, 0xd8, 0x0, 0x83, 0x80];
_T CJK_Compatibility_Ideographs = [0xa0, 0xf9, 0x0, 0x82, 0x0];
_T CJK_Symbols_and_Punctuation = [0xa0, 0x30, 0x0, 0x40];
_T Gothic = [0xa1, 0x3, 0x30, 0x20];
_T Combining_Diacritical_Marks_Supplement = [0x9d, 0xc0, 0x40];
_T Phags_pa = [0xa0, 0xa8, 0x40, 0x40];
_T Miscellaneous_Symbols_and_Arrows = [0xa0, 0x2b, 0x0, 0x81, 0x0];
_T Bamum = [0xa0, 0xa6, 0xa0, 0x60];
_T Chakma = [0xa1, 0x11, 0x0, 0x50];
_T Kana_Supplement = [0xa1, 0xb0, 0x0, 0x81, 0x0];
_T Tagalog = [0x97, 0x0, 0x20];
_T Tagbanwa = [0x97, 0x60, 0x20];
_T Devanagari = [0x89, 0x0, 0x80, 0x80];
_T Old_Italic = [0xa1, 0x3, 0x0, 0x30];
_T Arabic_Mathematical_Alphabetic_Symbols = [0xa1, 0xee, 0x0, 0x81, 0x0];
_T CJK_Unified_Ideographs_Extension_D = [0xa2, 0xb7, 0x40, 0x80, 0xe0];
_T CJK_Unified_Ideographs_Extension_A = [0xa0, 0x34, 0x0, 0x99, 0xc0];
_T CJK_Unified_Ideographs_Extension_B = [0xa2, 0x0, 0x0, 0xa0, 0xa6, 0xe0];
_T CJK_Unified_Ideographs_Extension_C = [0xa2, 0xa7, 0x0, 0x90, 0x40];
_T Cyrillic = [0x84, 0x0, 0x81, 0x0];
_U[] _tab = [
_U("Aegean Numbers", Aegean_Numbers),
_U("Alchemical Symbols", Alchemical_Symbols),
_U("Alphabetic Presentation Forms", Alphabetic_Presentation_Forms),
_U("Ancient Greek Musical Notation", Ancient_Greek_Musical_Notation),
_U("Ancient Greek Numbers", Ancient_Greek_Numbers),
_U("Ancient Symbols", Ancient_Symbols),
_U("Arabic", Arabic),
_U("Arabic Extended-A", Arabic_Extended_A),
_U("Arabic Mathematical Alphabetic Symbols", Arabic_Mathematical_Alphabetic_Symbols),
_U("Arabic Presentation Forms-A", Arabic_Presentation_Forms_A),
_U("Arabic Presentation Forms-B", Arabic_Presentation_Forms_B),
_U("Arabic Supplement", Arabic_Supplement),
_U("Armenian", Armenian),
_U("Arrows", Arrows),
_U("Avestan", Avestan),
_U("Balinese", Balinese),
_U("Bamum", Bamum),
_U("Bamum Supplement", Bamum_Supplement),
_U("Basic Latin", Basic_Latin),
_U("Batak", Batak),
_U("Bengali", Bengali),
_U("Block Elements", Block_Elements),
_U("Bopomofo", Bopomofo),
_U("Bopomofo Extended", Bopomofo_Extended),
_U("Box Drawing", Box_Drawing),
_U("Brahmi", Brahmi),
_U("Braille Patterns", Braille_Patterns),
_U("Buginese", Buginese),
_U("Buhid", Buhid),
_U("Byzantine Musical Symbols", Byzantine_Musical_Symbols),
_U("Carian", Carian),
_U("Chakma", Chakma),
_U("Cham", Cham),
_U("Cherokee", Cherokee),
_U("CJK Compatibility", CJK_Compatibility),
_U("CJK Compatibility Forms", CJK_Compatibility_Forms),
_U("CJK Compatibility Ideographs", CJK_Compatibility_Ideographs),
_U("CJK Compatibility Ideographs Supplement", CJK_Compatibility_Ideographs_Supplement),
_U("CJK Radicals Supplement", CJK_Radicals_Supplement),
_U("CJK Strokes", CJK_Strokes),
_U("CJK Symbols and Punctuation", CJK_Symbols_and_Punctuation),
_U("CJK Unified Ideographs", CJK_Unified_Ideographs),
_U("CJK Unified Ideographs Extension A", CJK_Unified_Ideographs_Extension_A),
_U("CJK Unified Ideographs Extension B", CJK_Unified_Ideographs_Extension_B),
_U("CJK Unified Ideographs Extension C", CJK_Unified_Ideographs_Extension_C),
_U("CJK Unified Ideographs Extension D", CJK_Unified_Ideographs_Extension_D),
_U("Combining Diacritical Marks", Combining_Diacritical_Marks),
_U("Combining Diacritical Marks for Symbols", Combining_Diacritical_Marks_for_Symbols),
_U("Combining Diacritical Marks Supplement", Combining_Diacritical_Marks_Supplement),
_U("Combining Half Marks", Combining_Half_Marks),
_U("Common Indic Number Forms", Common_Indic_Number_Forms),
_U("Control Pictures", Control_Pictures),
_U("Coptic", Coptic),
_U("Counting Rod Numerals", Counting_Rod_Numerals),
_U("Cuneiform", Cuneiform),
_U("Cuneiform Numbers and Punctuation", Cuneiform_Numbers_and_Punctuation),
_U("Currency Symbols", Currency_Symbols),
_U("Cypriot Syllabary", Cypriot_Syllabary),
_U("Cyrillic", Cyrillic),
_U("Cyrillic Extended-A", Cyrillic_Extended_A),
_U("Cyrillic Extended-B", Cyrillic_Extended_B),
_U("Cyrillic Supplement", Cyrillic_Supplement),
_U("Deseret", Deseret),
_U("Devanagari", Devanagari),
_U("Devanagari Extended", Devanagari_Extended),
_U("Dingbats", Dingbats),
_U("Domino Tiles", Domino_Tiles),
_U("Egyptian Hieroglyphs", Egyptian_Hieroglyphs),
_U("Emoticons", Emoticons),
_U("Enclosed Alphanumerics", Enclosed_Alphanumerics),
_U("Enclosed Alphanumeric Supplement", Enclosed_Alphanumeric_Supplement),
_U("Enclosed CJK Letters and Months", Enclosed_CJK_Letters_and_Months),
_U("Enclosed Ideographic Supplement", Enclosed_Ideographic_Supplement),
_U("Ethiopic", Ethiopic),
_U("Ethiopic Extended", Ethiopic_Extended),
_U("Ethiopic Extended-A", Ethiopic_Extended_A),
_U("Ethiopic Supplement", Ethiopic_Supplement),
_U("General Punctuation", General_Punctuation),
_U("Geometric Shapes", Geometric_Shapes),
_U("Georgian", Georgian),
_U("Georgian Supplement", Georgian_Supplement),
_U("Glagolitic", Glagolitic),
_U("Gothic", Gothic),
_U("Greek and Coptic", Greek_and_Coptic),
_U("Greek Extended", Greek_Extended),
_U("Gujarati", Gujarati),
_U("Gurmukhi", Gurmukhi),
_U("Halfwidth and Fullwidth Forms", Halfwidth_and_Fullwidth_Forms),
_U("Hangul Compatibility Jamo", Hangul_Compatibility_Jamo),
_U("Hangul Jamo", Hangul_Jamo),
_U("Hangul Jamo Extended-A", Hangul_Jamo_Extended_A),
_U("Hangul Jamo Extended-B", Hangul_Jamo_Extended_B),
_U("Hangul Syllables", Hangul_Syllables),
_U("Hanunoo", Hanunoo),
_U("Hebrew", Hebrew),
_U("High Private Use Surrogates", High_Private_Use_Surrogates),
_U("High Surrogates", High_Surrogates),
_U("Hiragana", Hiragana),
_U("Ideographic Description Characters", Ideographic_Description_Characters),
_U("Imperial Aramaic", Imperial_Aramaic),
_U("Inscriptional Pahlavi", Inscriptional_Pahlavi),
_U("Inscriptional Parthian", Inscriptional_Parthian),
_U("IPA Extensions", IPA_Extensions),
_U("Javanese", Javanese),
_U("Kaithi", Kaithi),
_U("Kana Supplement", Kana_Supplement),
_U("Kanbun", Kanbun),
_U("Kangxi Radicals", Kangxi_Radicals),
_U("Kannada", Kannada),
_U("Katakana", Katakana),
_U("Katakana Phonetic Extensions", Katakana_Phonetic_Extensions),
_U("Kayah Li", Kayah_Li),
_U("Kharoshthi", Kharoshthi),
_U("Khmer", Khmer),
_U("Khmer Symbols", Khmer_Symbols),
_U("Lao", Lao),
_U("Latin-1 Supplement", Latin_1_Supplement),
_U("Latin Extended-A", Latin_Extended_A),
_U("Latin Extended Additional", Latin_Extended_Additional),
_U("Latin Extended-B", Latin_Extended_B),
_U("Latin Extended-C", Latin_Extended_C),
_U("Latin Extended-D", Latin_Extended_D),
_U("Lepcha", Lepcha),
_U("Letterlike Symbols", Letterlike_Symbols),
_U("Limbu", Limbu),
_U("Linear B Ideograms", Linear_B_Ideograms),
_U("Linear B Syllabary", Linear_B_Syllabary),
_U("Lisu", Lisu),
_U("Low Surrogates", Low_Surrogates),
_U("Lycian", Lycian),
_U("Lydian", Lydian),
_U("Mahjong Tiles", Mahjong_Tiles),
_U("Malayalam", Malayalam),
_U("Mandaic", Mandaic),
_U("Mathematical Alphanumeric Symbols", Mathematical_Alphanumeric_Symbols),
_U("Mathematical Operators", Mathematical_Operators),
_U("Meetei Mayek", Meetei_Mayek),
_U("Meetei Mayek Extensions", Meetei_Mayek_Extensions),
_U("Meroitic Cursive", Meroitic_Cursive),
_U("Meroitic Hieroglyphs", Meroitic_Hieroglyphs),
_U("Miao", Miao),
_U("Miscellaneous Mathematical Symbols-A", Miscellaneous_Mathematical_Symbols_A),
_U("Miscellaneous Mathematical Symbols-B", Miscellaneous_Mathematical_Symbols_B),
_U("Miscellaneous Symbols", Miscellaneous_Symbols),
_U("Miscellaneous Symbols and Arrows", Miscellaneous_Symbols_and_Arrows),
_U("Miscellaneous Symbols And Pictographs", Miscellaneous_Symbols_And_Pictographs),
_U("Miscellaneous Technical", Miscellaneous_Technical),
_U("Modifier Tone Letters", Modifier_Tone_Letters),
_U("Mongolian", Mongolian),
_U("Musical Symbols", Musical_Symbols),
_U("Myanmar", Myanmar),
_U("Myanmar Extended-A", Myanmar_Extended_A),
_U("New Tai Lue", New_Tai_Lue),
_U("NKo", NKo),
_U("Number Forms", Number_Forms),
_U("Ogham", Ogham),
_U("Ol Chiki", Ol_Chiki),
_U("Old Italic", Old_Italic),
_U("Old Persian", Old_Persian),
_U("Old South Arabian", Old_South_Arabian),
_U("Old Turkic", Old_Turkic),
_U("Optical Character Recognition", Optical_Character_Recognition),
_U("Oriya", Oriya),
_U("Osmanya", Osmanya),
_U("Phags-pa", Phags_pa),
_U("Phaistos Disc", Phaistos_Disc),
_U("Phoenician", Phoenician),
_U("Phonetic Extensions", Phonetic_Extensions),
_U("Phonetic Extensions Supplement", Phonetic_Extensions_Supplement),
_U("Playing Cards", Playing_Cards),
_U("Private Use Area", Private_Use_Area),
_U("Rejang", Rejang),
_U("Rumi Numeral Symbols", Rumi_Numeral_Symbols),
_U("Runic", Runic),
_U("Samaritan", Samaritan),
_U("Saurashtra", Saurashtra),
_U("Sharada", Sharada),
_U("Shavian", Shavian),
_U("Sinhala", Sinhala),
_U("Small Form Variants", Small_Form_Variants),
_U("Sora Sompeng", Sora_Sompeng),
_U("Spacing Modifier Letters", Spacing_Modifier_Letters),
_U("Specials", Specials),
_U("Sundanese", Sundanese),
_U("Sundanese Supplement", Sundanese_Supplement),
_U("Superscripts and Subscripts", Superscripts_and_Subscripts),
_U("Supplemental Arrows-A", Supplemental_Arrows_A),
_U("Supplemental Arrows-B", Supplemental_Arrows_B),
_U("Supplemental Mathematical Operators", Supplemental_Mathematical_Operators),
_U("Supplemental Punctuation", Supplemental_Punctuation),
_U("Supplementary Private Use Area-A", Supplementary_Private_Use_Area_A),
_U("Supplementary Private Use Area-B", Supplementary_Private_Use_Area_B),
_U("Syloti Nagri", Syloti_Nagri),
_U("Syriac", Syriac),
_U("Tagalog", Tagalog),
_U("Tagbanwa", Tagbanwa),
_U("Tags", Tags),
_U("Tai Le", Tai_Le),
_U("Tai Tham", Tai_Tham),
_U("Tai Viet", Tai_Viet),
_U("Tai Xuan Jing Symbols", Tai_Xuan_Jing_Symbols),
_U("Takri", Takri),
_U("Tamil", Tamil),
_U("Telugu", Telugu),
_U("Thaana", Thaana),
_U("Thai", Thai),
_U("Tibetan", Tibetan),
_U("Tifinagh", Tifinagh),
_U("Transport And Map Symbols", Transport_And_Map_Symbols),
_U("Ugaritic", Ugaritic),
_U("Unified Canadian Aboriginal Syllabics", Unified_Canadian_Aboriginal_Syllabics),
_U("Unified Canadian Aboriginal Syllabics Extended", Unified_Canadian_Aboriginal_Syllabics_Extended),
_U("Vai", Vai),
_U("Variation Selectors", Variation_Selectors),
_U("Variation Selectors Supplement", Variation_Selectors_Supplement),
_U("Vedic Extensions", Vedic_Extensions),
_U("Vertical Forms", Vertical_Forms),
_U("Yijing Hexagram Symbols", Yijing_Hexagram_Symbols),
_U("Yi Radicals", Yi_Radicals),
_U("Yi Syllables", Yi_Syllables),
];
}
