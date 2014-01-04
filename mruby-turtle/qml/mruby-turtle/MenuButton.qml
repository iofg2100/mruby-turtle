import QtQuick 2.0

Rectangle {

    width: 64
    height: 32
    id: root
    signal clicked
    property string text
    property bool checked: mouseArea.pressed
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
    Text {
        anchors.fill: parent
        anchors.margins: 4
        text: root.text
        verticalAlignment: Text.AlignVCenter
        font.family: "Helvetica Neue"
        font.weight: Font.Light
        color: root.checked ? "red" : "black"
    }
}
