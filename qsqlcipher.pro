TARGET = qsqlcipher
CONFIG+=c++14

QT_FOR_CONFIG += sqldrivers-private

HEADERS += $$PWD/qsql_sqlite_p.h
SOURCES += $$PWD/qsql_sqlite.cpp $$PWD/smain.cpp

android {
    message(building for $$ANDROID_TARGET_ARCH)
    INCLUDEPATH += $$PWD/android-libs/$$ANDROID_TARGET_ARCH
    LIBS += $$PWD/android-libs/$$ANDROID_TARGET_ARCH/libsqlcipher.a
    LIBS += $$PWD/android-libs/$$ANDROID_TARGET_ARCH/libcrypto.a
} else {
    CONFIG += link_pkgconfig
    PKGCONFIG += sqlcipher
# or if pkg-config is not available
# set manually the INCLUDEPATH and LIBS
}

OTHER_FILES += sqlcipher.json .qmake.conf \
    README.md \
    LICENSE \
    android-libs/VERSIONS \
    android-libs/LICENSE.sqlcipher
    android-libs/LICENSE.openssl

PLUGIN_CLASS_NAME = QSQLCipherDriverPlugin

# follows contents of include(../qsqldriverbase.pri)
QT  = core core-private sql-private

PLUGIN_TYPE = sqldrivers
load(qt_plugin)

DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII
