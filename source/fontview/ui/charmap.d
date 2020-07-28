module fontview.ui.charmap;

import std.stdio;
import dlangui;

class UnicodeMap : VerticalLayout
{
    this(string id) {
        super(id);
        fillParent();

        dstring[] fontSizes;
        foreach (size; [6, 7, 8, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 32, 36, 48, 72])
            fontSizes ~= to!dstring(size);

        // font size and code input
        auto controls1 = new HorizontalLayout()
            .fillHorizontal
            .padding(3.pointsToPixels);
        controls1.addChild(new TextWidget(null, "Size"d));
        ComboBox sizes = new ComboBox("size", fontSizes);
        sizes.selectedItemIndex = 7;
        controls1.addChild(sizes);
        controls1.addChild(new TextWidget(null, "Find by code"d));
        EditLine codeEdit = new EditLine(null);
        controls1.addChild(codeEdit);

        // create grid content
        StringGridWidget grid = new StringGridWidget("GRID1");
        grid.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        grid.showColHeaders = true;
        grid.showRowHeaders = true;
        grid.resize(16, 16);

        int currentCode = 0x25e0;

        for (int y = 0; y < grid.rows; y++) {
            for (int x = 0; x < grid.cols; x++) {
                dstring res = [currentCode + 16 * y + x];
                grid.setCellText(x, y, res);
            }
            grid.setRowTitle(y, to!dstring(currentCode + 16 * y, 16));
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
        EditLine itemtext = new EditLine(null);
        itemtext.layoutWidth(FILL_PARENT);
        Button btn_clear = new Button(null, "Clear"d);
        Button btn_copy = new Button(null, "Copy"d);
        controls2.addChildren([itemtext, btn_clear, btn_copy]);

        // signal handlers
        sizes.itemClick = delegate(Widget source, int itemIndex) {
            auto combo = cast(ComboBox)source;
            string size = to!string(combo.items[itemIndex]);
            grid.fontSize = to!int(size);
            return true;
        };

        addChild(controls1);
        addChild(grid);
        addChild(controls2);
    }
}
