TARGET = qsqlcipher

QT_FOR_CONFIG += sqldrivers-private

HEADERS += $$PWD/qsql_sqlite_p.h
SOURCES += $$PWD/qsql_sqlite.cpp $$PWD/smain.cpp

system-sqlcipher {
    CONFIG += link_pkgconfig
    PKGCONFIG += sqlcipher
    # or if pkg-config is not available
    # INCLUDEPATH += /path/to/include/sqlcipher
    # LIBS += -L/path/to/lib/ -lsqlcipher -lcrypto
} else {
    include($$PWD/../3rdparty/sqlcipher.pri)
}

OTHER_FILES += sqlcipher.json .qmake.conf

PLUGIN_CLASS_NAME = QSQLCipherDriverPlugin

# follows contents of include(../qsqldriverbase.pri)
QT  = core core-private sql-private

PLUGIN_TYPE = sqldrivers
load(qt_plugin)

DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

!system-sqlcipher {
    QMAKE_EXTRA_TARGETS += libtomcrypt
    win32-msvc {
        libtomcrypt.commands = cd $$PWD/../3rdparty/libtomcrypt && \
        nmake -f makefile.msvc CFLAGS="/Ox"
    } else {
        libtomcrypt.commands = cd $$PWD/../3rdparty/libtomcrypt && make library CFLAGS=-fPIC
    }
    PRE_TARGETDEPS += libtomcrypt
}
