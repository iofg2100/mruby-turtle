import QtQuick 2.0

QtObject {
    property string cellType
    property QtObject cells

    function save(url) {
        mapModel.size = editorField.fieldSize
        editorField.eachItem(function(item, x, y){
            mapModel.setCell(x, y, item.type)
        })
        mapModel.save(url)
    }
    function load(url) {
        mapModel.load(url)
        editorField.fieldSize = mapModel.size
        editorField.eachItem(function(item, x, y) {
            item.type = mapModel.cell(x, y)
        })
    }
}
