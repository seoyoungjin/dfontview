module fontview.ui.codetable;

import dlangui;

class CodeTable : VerticalLayout
{
    this() {
        this(null);
    }

    this(string id) {
        super(id);

        auto canvas = new CodeTableCanvas();
        canvas.backgroundColor = 0xFFFFFF;
        canvas.layoutWidth = 500;
        canvas.layoutHeight = 500;
        // canvas.layoutWidth = FILL_PARENT;
        // canvas.layoutHeight = FILL_PARENT;
        canvas.padding(Rect(10,10,10,10));

        addChild(canvas);
    }
}

class CodeTableCanvas : CanvasWidget
{
    int squareSize;

    this() {
        this(null);
    }

    this(string id) {
        super(id);
        squareSize = 24;
    }

    protected void refresh()
    {
        // squareSize = max(24, font.height * 3);
    }

    override void doDraw(DrawBuf buf, Rect rc) {
        int beginRow = rc.top / squareSize;
        int endRow = rc.bottom / squareSize;
        int beginCol = rc.left / squareSize;
        int endCol = rc.right / squareSize;

        int y = rc.top;
        for (int row = beginRow; row <= endRow; ++row) {
            buf.drawLine(Point(rc.left, y), Point(rc.right, y), textColor);
            y += squareSize;
        }
    }
}