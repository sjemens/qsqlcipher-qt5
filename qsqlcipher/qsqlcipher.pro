TEMPLATE = lib
TARGET = qsqlcipher

CONFIG(release, debug|release): DEFINES *= NDEBUG
win32 {
    CONFIG(release, debug|release): DESTDIR = release/sqldrivers
    else:CONFIG(debug, debug|release): DESTDIR = debug/sqldrivers
    # Produce full-symbolic debugging information in qsqlcipher.pdb file
    QMAKE_CXXFLAGS_RELEASE += /Zi
    QMAKE_LFLAGS_RELEASE += /DEBUG
}
else:DESTDIR = sqldrivers

unix:!macx {
    CONFIG += link_pkgconfig
    PKGCONFIG += \
        libssl \
        libcrypto

    QMAKE_CFLAGS_DEBUG *= -Wno-unused-parameter -Wno-sign-compare -Wno-implicit-fallthrough -Wno-unused-function -g
    QMAKE_CFLAGS_RELEASE *= -Wno-unused-parameter -Wno-sign-compare -Wno-implicit-fallthrough -Wno-unused-function -g
}
else:win32 {
    INCLUDEPATH += C:/OpenSSL/include
    win32-msvc*:LIBS += C:/OpenSSL/lib/libssl.lib C:/OpenSSL/lib/libcrypto.lib
    # win32-g++:LIBS += c:/OpenSSL/lib/MinGW/libeay32.a
    QMAKE_LFLAGS += /DEBUG
}
else:macx {
    LIBS += \
        -L$$PWD/../../dependencies/external/openssl/artifacts/release \
        -lssl \
        -lcrypto \
        -lz

    INCLUDEPATH +=$$PWD/../../dependencies/external/openssl/artifacts/release/include
    QMAKE_LFLAGS += -isysroot $$QMAKE_MAC_SDK_PATH
    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.13

    # To avoid errors on macdeployqt
    CONFIG -=force_debug_info
    CONFIG -=separate_debug_info

    QMAKE_POST_LINK += /usr/bin/dsymutil $$DESTDIR/libqsqlcipher.dylib -o $$DESTDIR/libqsqlcipher.dSYM
}

CONFIG += qt plugin

# follows contents of include(../qsqldriverbase.pri)
QT  = core core_private sql_private

DEFINES += \
    QT_NO_CAST_TO_ASCII \
    SQLITE_OMIT_LOAD_EXTENSION \
    SQLITE_OMIT_COMPLETE \
    SQLITE_HAS_CODEC \
    SQLCIPHER_CRYPTO_OPENSSL \
    SQLITE_ENABLE_JSON1 \
    SQLITE_ENABLE_COLUMN_METADATA

INCLUDEPATH += $$PWD qsqlcipher
HEADERS += qsqlcipher/qsql_sqlite_p.h
SOURCES += qsqlcipher/qsql_sqlite.cpp qsqlcipher/smain.cpp

INCLUDEPATH +=  sqlcipher
HEADERS +=      sqlcipher/sqlite3.h
SOURCES +=      sqlcipher/sqlite3.c

OTHER_FILES += qsqlcipher/sqlcipher.json qsqlcipher/.qmake.conf

unix:!macx {
    # install
    target.path = $$[QT_INSTALL_PLUGINS]
    INSTALLS += target
}
