#include "mapmodel.h"
#include "flashmodel.h"
#include <QFile>
#include <QJsonDocument>
#include <QVariant>
#include <QUrl>
#include <QRect>

MapModel::MapModel(QObject *parent) :
    QObject(parent)
{
}

MapModel MapModel::instance;

void MapModel::setCell(int x, int y, const QString &type)
{
    if (validatePos(x, y)) {
        mCells[y * mSize.width()+ x] = type;
    }
}

QString MapModel::cell(int x, int y) const
{
    if (validatePos(x, y)) {
        return mCells.at(y * mSize.width() + x);
    } else {
        return QString();
    }
}

void MapModel::setSize(const QSize &size)
{
    if (mSize == size) return;
    mSize = size;
    emit sizeChanged(size);
    mCells.resize(size.width() * size.height());
}

namespace {

QVariant parseJsonFile(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QVariant();
    }
    auto document = QJsonDocument::fromJson(file.readAll());
    return document.toVariant();
}

bool emitJsonFile(const QVariant &variant, const QString &filePath)
{
    auto document = QJsonDocument::fromVariant(variant);
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        return false;
    }
    file.write(document.toJson());
    return true;
}

} // anonymous namespace

void MapModel::load(const QUrl &fileUrl)
{
    auto data = parseJsonFile(fileUrl.toLocalFile()).toMap();
    int w = data["width"].toInt();
    int h = data["height"].toInt();
    auto cells = data["cells"].toStringList().toVector();
    if (w > 0 && h > 0 && cells.size() == w * h) {
        mSize = QSize(w, h);
        mCells = cells;
        emit sizeChanged(mSize);
    } else {
        FlashModel::instance.setText("Failed to load file");
    }
}

void MapModel::save(const QUrl &fileUrl) const
{
    QVariantMap data;
    data["width"] = mSize.width();
    data["height"] = mSize.height();
    data["cells"] = QStringList(mCells.toList());
    if (!emitJsonFile(data, fileUrl.toLocalFile())) {
        FlashModel::instance.setText("Failed to save file");
    }
}

bool MapModel::validatePos(int x, int y) const
{
    return QRect(QPoint(), mSize).contains(x, y);
}
