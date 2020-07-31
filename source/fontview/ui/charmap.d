module fontview.ui.charmap;

import std.stdio;
import std.ascii;
import std.format;
import std.algorithm;
import std.uni;

import dlangui;
import fontview.ui.appdata;

class UnicodeMap : VerticalLayout
{
    this(string id) {
        super(id);
        fillParent();

        dstring[] fontSizes;
        foreach (size; [6, 7, 8, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 32, 36, 48])
            fontSizes ~= to!dstring(size);

        // font size and code input
        auto controls1 = new HorizontalLayout()
            .fillHorizontal
            .padding(3.pointsToPixels);
        controls1.addChild(new TextWidget(null, "Size"d));
        ComboBox sizes = new ComboBox("size", fontSizes);
        sizes.selectedItemIndex = 7;
        controls1.addChild(sizes);
        controls1.addChild(new TextWidget(null, "Find character"d));
        EditLine codeEdit = new EditLine(null);
        controls1.addChild(codeEdit);

        // create grid content
        StringGridWidget grid = new StringGridWidget("GRID1");
        grid.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        grid.showColHeaders = true;
        grid.showRowHeaders = true;
        grid.customCellAdapter = new FontViewGridCellAdapter(grid);
        // LATER - depends on font
        appData.genUnicodeMap();
        grid.resize(16, appData.unicodeMap.length);

        for (int y = 0; y < grid.rows; y++) {
            for (int x = 0; x < grid.cols; x++) {
                dstring res = [appData.unicodeMap[y] + x];
                grid.setCellText(x, y, res);
            }
            grid.setRowTitle(y, format("%04X"d, appData.unicodeMap[y]));
        }

        for (int x = 0; x < grid.cols; x++) {
            dstring res = to!dstring(x, 16);
            grid.setColTitle(x, res);
        }
        grid.autoFit();

        // clipboard
        auto controls2 = new HorizontalLayout()
            .fillHorizontal
            .padding(3.pointsToPixels);
        EditLine itemText = new EditLine(null);
        itemText.layoutWidth(FILL_PARENT);
        Button btnClear = new Button(null, "Clear"d);
        Button btnCopy = new Button(null, "Copy"d);
        controls2.addChildren([itemText, btnClear, btnCopy]);

        // signal handlers
        sizes.itemClick = delegate(Widget source, int itemIndex) {
            auto combo = cast(ComboBox)source;
            string size = to!string(combo.items[itemIndex]);
            grid.fontSize = to!int(size);
            grid.autoFit();
            return true;
        };

        codeEdit.contentChange = delegate(EditableContent content) {
            if (content.text.length == 0)
                return;
            if (1 < content.text.length)
                codeEdit.text = codeEdit.text[0 .. 1];
            int code = codeEdit.text[0];
            int row = appData.unicodeMapIndex(code);
            // LATER BUG? - row and col differs 1
            if (row != -1)
                grid.selectCell((code & 15) + 1, row + 1);
        };

        // Callback for handling of cell double click or Enter key press
        grid.cellActivated = delegate(GridWidgetBase source, int col, int row) {
            StringGridWidgetBase w = cast(StringGridWidgetBase)source;
            itemText.text(itemText.text ~ w.cellText(col, row));
        };

        btnCopy.click = delegate(Widget src)
        {
            platform.setClipboardText(itemText.text);
            return true;
        };

        btnClear.click = delegate(Widget src)
        {
            itemText.text = ""d;
            return true;
        };

        addChild(controls1);
        addChild(grid);
        addChild(controls2);
    }
}

class FontViewGridCellAdapter : CustomGridCellAdapter {
    StringGridWidget _grid;
    int _gridSize = 24;

    this(StringGridWidget w) {
        _grid = w;
    }

    /// return true for custom drawn cell
    override bool isCustomCell(int col, int row) {
        //if (col < 0 || row < 0)
        return true;
    }

    /// return cell size
    override Point measureCell(int col, int row) {
        _gridSize = max(24, _grid.fontSize * 2);
        int w, h;
        w = h = _gridSize;
        if (col < 0)
            w = currentTheme.fontSize * 3;
        if (row < 0)
            h = currentTheme.fontSize + 4;
        return Point(w, h);
    }

    /// draw data cell content
    override void drawCell(DrawBuf buf, Rect rc, int col, int row) {
        if (row < 0 && col < 0)
            return;
        rc.shrink(2, 1);
        FontRef fnt;
        if (row < 0 || col < 0)
            fnt = currentTheme.font;
        else
            fnt = _grid.font;
        if (fnt.isNull)
            return;
        dstring txt;
        if (row < 0)
            txt = _grid.colTitle(col);
        else if (col < 0)
            txt = _grid.rowTitle(row);
        else
            txt = _grid.cellText(col, row);
        if (!txt.length)
            return;
        Point sz = fnt.textSize(txt);
        Align ha = Align.HCenter;
        if (col < 0)
            ha = Align.Right;
        _grid.applyAlign(rc, sz, ha, Align.VCenter);
        uint cl = _grid.textColor;
        fnt.drawText(buf, rc.left, rc.top, txt, cl);
    }
}
