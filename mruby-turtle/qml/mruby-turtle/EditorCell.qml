import QtQuick 2.0

Cell {
    border.color: "lightgray"
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onPressed: {
            if (pressedButtons & Qt.LeftButton) {
                var type = editorViewModel.cellType
                if (type === "Turtle") {
                    editorField.eachItem(function (item, x, y) {
                        if (item.type === "Turtle") {
                            item.type = ""
                        }
                    })
                }
                parent.type = type
            } else if (pressedButtons & Qt.RightButton) {
                parent.type = ""
            }
        }
    }
}
