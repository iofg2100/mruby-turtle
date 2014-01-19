import QtQuick 2.2
import QtQuick.Controls 1.1
import Garnet 1.0 as Garnet

Rectangle {
    width: 256
    height: 256

    Column {
        anchors.fill: parent
        spacing: 16
        Text {
            id: error
            width: 256
            height: 32
            font.family: "Source Code Pro"
            font.pointSize: 9
            wrapMode: Text.Wrap
            color: "#f00"
        }
        TextArea {
            id: textArea
            width: 256
            height: 160
            font.family: "Source Code Pro"
            text: "# insert code"
        }
        Row {
            MenuButton {
                text: timer.running ? "Stop" : "Run"
                onClicked: {
                    timer.running = !timer.running
                }
            }
        }
    }

    Garnet.Engine {
        id: garnetEngine
        property Player turtle: player
        onTurtleChanged: {
            registerObject("turtle", turtle)
        }
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: false
        onTriggered: {
            console.log(garnetEngine.evaluate(textArea.text))
            error.text = garnetEngine.error
            if (garnetEngine.hasError) {
                running = false
            }
        }
    }
}
