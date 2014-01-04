import QtQuick 2.2
import QtQuick.Dialogs 1.1

Rectangle {
    width: 800
    height: 400

    Row {
        anchors.centerIn: parent
        spacing: 32
        Menu {
        }
        EditorField {
            id: editorField
        }
        CellPalette {
        }
    }

    EditorViewModel {
        id: editorViewModel
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
}
