import QtQuick 2.0

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
}
