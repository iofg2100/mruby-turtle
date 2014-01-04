import QtQuick 2.0

Item {
    id: root

    width: 256
    height: 256

    property size fieldSize: Qt.size(8, 8)

    Grid {
        rows: root.fieldSize.height
        columns: root.fieldSize.width
        Repeater {
            id: repeater
            model: fieldSize.width * fieldSize.height
            EditorCell {
            }
        }
    }
    function eachItem(f) {
        for (var y = 0; y < fieldSize.height; ++y) {
            for (var x = 0; x < fieldSize.width; ++x) {
                f(itemAt(x, y), x, y)
            }
        }
    }
    function itemAt(x, y) {
        return repeater.itemAt(y * fieldSize.width + x)
    }
}

