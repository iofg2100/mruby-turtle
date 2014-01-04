import QtQuick 2.0

Rectangle {
    Column {
        MenuButton {
            text: "Save"
            onClicked: fileSaveDialog.open()
        }
        MenuButton {
            text: "Open"
            onClicked: fileLoadDialog.open()
        }
    }
    width: 96
    height: 128
}
