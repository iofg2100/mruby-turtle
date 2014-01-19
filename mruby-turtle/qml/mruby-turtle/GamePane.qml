import QtQuick 2.0

Rectangle {
    width: 256 * 2 + 32
    height: 256
    Row {
        spacing: 32
        GameField {
            id: gameField
        }
        ScriptEditor {
            id: scriptEditor
        }
    }
    Player {
        id: player
    }
    onEnabledChanged: {
        if (enabled) {
            gameField.reset()
        }
    }
}
