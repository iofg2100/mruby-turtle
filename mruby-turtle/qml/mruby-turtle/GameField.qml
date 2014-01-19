import QtQuick 2.0

Rectangle {
    id: field
    width: 256
    height: 256

    property int columnCount: 0
    property int rowCount: 0
    property var items: []

    function typeAt(col, row) {
        for (var i = 0; i < items.length; ++i) {
            var item = items[i]
            if (item.column == col && item.row == row) {
                return item.type
            }
        }
        return ""
    }

    function reset() {
        items.forEach(function(item){
            item.destroy()
        })
        columnCount = mapModel.size.width
        rowCount = mapModel.size.height

        for (var y = 0; y < rowCount; ++y) {
            for (var x = 0; x < columnCount; ++x) {
                var component = Qt.createComponent("GameCell.qml")
                var type = mapModel.cell(x, y)
                if (type === "") {
                    continue
                }
                var cell;
                if (type === "Turtle")
                {
                    cell = component.createObject(field, {
                            column: Qt.binding(function(){ return player.column }),
                            row: Qt.binding(function(){ return player.row })
                    })
                    player.column = x
                    player.row = y
                } else {
                    cell = component.createObject(field)
                    cell.column = x
                    cell.row = y
                }
                cell.type = type
                items.push(cell)
            }
        }
    }
}
