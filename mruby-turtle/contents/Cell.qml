import QtQuick 2.0

Rectangle {
    id: cell
    width: 32
    height: 32
    property string type
    property Item item
    onTypeChanged: {

        console.log(type)

        if (item) {
            item.destroy()
        }

        if (type !== "") {
            var c = Qt.createComponent(type + ".qml");
            item = c.createObject(cell);
        }
    }
}
