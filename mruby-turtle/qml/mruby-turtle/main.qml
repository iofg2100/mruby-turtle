import QtQuick 2.2
import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.1

Rectangle {
    width: layout.implicitWidth + 64
    height: layout.implicitHeight + 64

    RowLayout {
        id: layout
        anchors.fill: parent
        anchors.margins: 32
        spacing: 32
        Item {
            Layout.fillWidth: true
        }
        Menu {
        }
        Item {
            width: gamePane.width
            height: gamePane.height
            GamePane {
                id: gamePane
                opacity: 0
                enabled: false
            }
            EditorPane {
                id: editorPane
                opacity: 0
                enabled: false
            }
        }
        Item {
            Layout.fillWidth: true
        }
    }

    MainViewModel {
        id: mainViewModel
    }

    FileDialog {
        id: fileLoadDialog
        nameFilters: ["Json File (*.json)"]
        onAccepted: editorViewModel.load(fileUrl)
    }

    FileDialog {
        id: fileSaveDialog
        selectExisting: false
        nameFilters: ["Json File (*.json)"]
        onAccepted: editorViewModel.save(fileUrl)
    }

    state: mainViewModel.mode
    states: [
        State {
            name: "game"
            PropertyChanges {
                target: gamePane
                opacity: 1
                enabled: true
            }
        },
        State {
            name: "editor"
            PropertyChanges {
                target: editorPane
                opacity: 1
                enabled: true
            }
        }
    ]
}
