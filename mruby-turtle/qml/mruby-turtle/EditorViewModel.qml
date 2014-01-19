import QtQuick 2.0

QtObject {
    property string cellType
    property QtObject cells
    property bool enabled: mainViewModel.mode == "editor"

    onEnabledChanged: {
        if (enabled == false) {
            saveModel()
        }
    }

    function saveModel() {
        mapModel.size = editorField.fieldSize
        editorField.eachItem(function(item, x, y){
            mapModel.setCell(x, y, item.type)
        })
    }

    function loadModel() {
        editorField.fieldSize = mapModel.size
        editorField.eachItem(function(item, x, y) {
            item.type = mapModel.cell(x, y)
        })
    }

    function save(url) {
        saveModel()
        mapModel.save(url)
    }
    function load(url) {
        mapModel.load(url)
        loadModel()
    }
}
