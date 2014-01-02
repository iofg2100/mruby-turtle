import QtQuick 2.0

Item {
    width: 256
    height: 256
    Grid {
        rows: 8
        columns: 8
        Repeater {
            model: 64
            EditorCell {
            }
        }
    }
}

