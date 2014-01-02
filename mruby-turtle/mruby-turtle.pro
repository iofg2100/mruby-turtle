TEMPLATE = app
QT += qml quick

SOURCES += main.cpp

# Installation path
# target.path =

RESOURCES += \
    mruby-turtle.qrc

OTHER_FILES += \
    contents/Block.qml \
    contents/main.qml \
    contents/CellSelector.qml \
    contents/CellPalette.qml \
    contents/Turtle.qml \
    contents/EditorCell.qml \
    contents/EditorState.js \
    contents/Cell.qml \
    contents/EditorField.qml
