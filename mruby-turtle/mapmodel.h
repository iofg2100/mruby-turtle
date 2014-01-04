#ifndef MAPMODEL_H
#define MAPMODEL_H

#include <QObject>
#include <QStringList>
#include <QSize>
#include <QVector>

class MapModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QSize size READ size WRITE setSize NOTIFY sizeChanged)

public:
    explicit MapModel(QObject *parent = 0);

    Q_INVOKABLE void setCell(int x, int y, const QString &type);
    Q_INVOKABLE QString cell(int x, int y) const;
    QSize size() const { return mSize; }
    void setSize(const QSize &size);

    static MapModel instance;

public slots:
    void load(const QUrl &fileUrl);
    void save(const QUrl &fileUrl) const;

signals:
    void sizeChanged(const QSize &);

private:
    bool validatePos(int x, int y) const;

    QSize mSize;
    QVector<QString> mCells;
};

#endif // MAPMODEL_H
