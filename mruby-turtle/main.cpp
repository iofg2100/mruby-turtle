#include "flashmodel.h"
#include "mapmodel.h"
#include "qtquick2applicationviewer.h"
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include <QtQml>
#include <Garnet/Engine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<Garnet::Engine>("Garnet", 1, 0, "Engine");

    QtQuick2ApplicationViewer viewer;
    auto context = viewer.rootContext();
    context->setContextProperty("mapModel", &MapModel::instance);
    context->setContextProperty("flashModel", &FlashModel::instance);
    viewer.setMainQmlFile(QStringLiteral("qml/mruby-turtle/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
