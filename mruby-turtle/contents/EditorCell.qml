import QtQuick 2.0
import "EditorState.js" as EditorState

Cell {
    border.color: "lightgray"
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onPressed: {
            if (pressedButtons & Qt.LeftButton) {
                console.log("left")
                parent.type = EditorState.type
            } else if (pressedButtons & Qt.RightButton) {
                console.log("right")
                parent.type = ""
            }
        }
    }
}
