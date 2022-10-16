// This is a modified test suite from
// https://github.com/sijk/qt5-sqlcipher/blob/master/test-shared/main.cpp
#include <QtTest/QtTest>
#include <QTemporaryDir>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>

class TestQSqlCipher: public QObject
{
    Q_OBJECT
private slots:
    void initTestCase() // will run once before the first test
    {
        // Check that the driver exists
        QVERIFY2(QSqlDatabase::isDriverAvailable("QSQLCIPHER"), "QSQLCIPHER driver not found.");
        // Set the database file
        QString dbname = QDir(tmpDir.path()).absoluteFilePath("test.db3");
        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLCIPHER", "db");
        db.setDatabaseName(dbname);
    }
    void cleanup()
    {
        QSqlDatabase db = QSqlDatabase::database("db", false);
        db.close();
    }
    void checkVersion();
    void checkCompileOptions();
    void createDbWithPassphrase();
    void refuseToReadWithoutPassphrase();
    void allowToReadWithPassphrase();
    void cleanupTestCase()
    {
        QSqlDatabase::removeDatabase("db");
    }
private:
    QTemporaryDir tmpDir;
};

void TestQSqlCipher::checkVersion()
{
    QSqlQuery q(QSqlDatabase::database("db"));
    QVERIFY2(q.exec("PRAGMA cipher_version;"), q.lastError().text().toLatin1().constData());
    QVERIFY(q.next());
    // Optional: Uncomment the next QCOMPARE
    // if there is a need to test for sqlcipher's version
    // QCOMPARE(q.value(0).toString(), QString("4.5.2 community"));
}

void TestQSqlCipher::checkCompileOptions()
{
    QSqlQuery q(QSqlDatabase::database("db"));
    QVERIFY2(q.exec("PRAGMA compile_options"), q.lastError().text().toLatin1().constData());
    bool hasCodec = false;
    while(q.next())
    {
        if(q.value(0).toString() == QString("HAS_CODEC"))
        {
            hasCodec = true;
            break;
        }
    }
    QVERIFY2(hasCodec, "'HAS_CODEC' should be in sqlcipher's compile_options.");
}

void TestQSqlCipher::createDbWithPassphrase()
{
    QSqlQuery q(QSqlDatabase::database("db"));
    QStringList queries;
    queries << "PRAGMA key='foobar'"
            << "create table foo(bar integer)"
            << "insert into foo values (42)";
    for(const QString& qs : queries)
    {
        QVERIFY2(q.exec(qs), q.lastError().text().toLatin1().constData());
    }
}

void TestQSqlCipher::refuseToReadWithoutPassphrase()
{
    QSqlQuery q(QSqlDatabase::database("db"));
    QVERIFY(!q.exec("select bar from foo"));
}

void TestQSqlCipher::allowToReadWithPassphrase()
{
    QSqlQuery q(QSqlDatabase::database("db"));
    QStringList queries;
    queries << "PRAGMA key='foobar'"
            << "select bar from foo";
    for(const QString& qs : queries)
    {
        QVERIFY2(q.exec(qs), q.lastError().text().toLatin1().constData());
    }
    QVERIFY(q.next());
    QVERIFY(q.value(0).toInt() == 42);
}

QTEST_GUILESS_MAIN(TestQSqlCipher)
#include "main.moc"
