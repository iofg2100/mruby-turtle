import QtQuick 2.0
import QtQuick.Dialogs 1.1

Rectangle {
    width: 256 * 2 + 32
    height: 256
    Row {
        spacing: 32
        EditorField {
            id: editorField
        }
        CellPalette {
            id: cellPalette
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

    function save() {
        fileSaveDialog.open()
    }
    function load() {
        fileLoadDialog.open()
    }
}
