import QtQuick 2.2
import QtQuick.Controls 1.1

Item {

    width: cell.width + text.width
    height: cell.height

    id: root
    signal pressed
    property string type
    property bool checked: false
    property ExclusiveGroup exclusiveGroup: null

    onExclusiveGroupChanged: {
        if (exclusiveGroup) {
            exclusiveGroup.bindCheckable(root)
        }
    }
    
    Cell {
        id: cell
        type: root.type
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            console.log("pressed")
            root.checked = true
            root.pressed()
        }
    }

    Item {
        id: text
        x: cell.width
        height: 32
        width: 128
        Text {
            anchors.fill: parent
            anchors.margins: 4
            text: root.type
            verticalAlignment: Text.AlignVCenter
            font.family: "Helvetica Neue"
            font.weight: Font.Light
            color: root.checked ? "red" : "black"
        }
    }

}



