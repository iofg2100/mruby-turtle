import QtQuick 2.0

Cell {
    property int column: 0
    property int row: 0
    x: column * width
    y: row * height
}
