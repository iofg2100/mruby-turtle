#ifndef FLASHMODEL_H
#define FLASHMODEL_H

#include <QObject>

class FlashModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
public:
    explicit FlashModel(QObject *parent = 0);
    static FlashModel instance;

    QString text() const { return mText; }
    void setText(const QString &text) { if (mText != text) { mText = text; emit textChanged(text); } }

signals:
    void textChanged(const QString &);

private:
    QString mText;
};

#endif // FLASHMODEL_H
