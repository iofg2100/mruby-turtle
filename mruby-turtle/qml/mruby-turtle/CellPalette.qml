import QtQuick 2.2
import QtQuick.Controls 1.1

Item {

    width: 256
    height: 256

    property string type
    onTypeChanged: {
        editorViewModel.cellType = type
    }

    Column {

        ExclusiveGroup {
            id: group
            onCurrentChanged: {
                type = current.type
            }
        }

        spacing: 4
        CellSelector {
            type: "Block"
            exclusiveGroup: group
            checked: true
        }
        CellSelector {
            type: "Turtle"
            exclusiveGroup: group
        }
    }
}
