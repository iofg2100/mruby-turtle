import QtQuick 2.0

QtObject {
    property int column
    property int row
    property int lastDir: 0

    // 0:right 1:bottom 2:left 3:top
    function move(direction) {
        direction %= 4
        var moveTo = function(dx, dy) {
            var nextX = column + dx
            var nextY = row + dy
            console.log("dx: " + dx)
            console.log("dy: " + dy)
            console.log("next column: " + nextX)
            console.log("next row: " + nextY)

            console.log(gameField.typeAt(nextX, nextY))
            if (gameField.typeAt(nextX, nextY) !== "") {
                return
            }
            if (nextX < 0 || gameField.columnCount <= nextX) {
                return
            }
            if (nextY < 0 || gameField.rowCount <= nextY) {
                return
            }

            column = nextX
            row = nextY
        }
        var dx = -(direction - 1) % 2
        var dy = -(direction - 2) % 2
        moveTo(dx, dy)
        lastDir = direction
    }

    function feel(direction) {
        var dx = -(direction - 1) % 2
        var dy = -(direction - 2) % 2
        return gameField.typeAt(dx + column, dy + row)
    }
}
