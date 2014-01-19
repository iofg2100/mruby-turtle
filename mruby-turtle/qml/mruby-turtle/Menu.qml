import QtQuick 2.2
import QtQuick.Layouts 1.1

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
        MenuButton {
            text: "Play"
            checked: mainViewModel.mode == "game"
            onClicked: mainViewModel.mode = "game"
        }
        MenuButton {
            text: "Edit"
            checked: mainViewModel.mode == "editor"
            onClicked: mainViewModel.mode = "editor"
        }
    }
    width: 64
    height: 256
}
