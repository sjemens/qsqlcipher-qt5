CONFIG(release, debug|release):DEFINES *= NDEBUG
DEFINES +=  SQLITE_HAS_CODEC \
            SQLCIPHER_CRYPTO_LIBTOMCRYPT \
            SQLITE_ENABLE_COLUMN_METADATA \
            SQLITE_OMIT_LOAD_EXTENSION \
            SQLITE_OMIT_COMPLETE \
            SQLITE_ENABLE_FTS3 \
            SQLITE_ENABLE_FTS3_PARENTHESIS \
            SQLITE_ENABLE_FTS5 \
            SQLITE_ENABLE_JSON1 \
            SQLITE_ENABLE_RTREE \
            SQLITE_ENABLE_SESSION

!contains(CONFIG, largefile):DEFINES += SQLITE_DISABLE_LFS
qtConfig(posix_fallocate): DEFINES += HAVE_POSIX_FALLOCATE=1
winrt {
    DEFINES += SQLITE_OS_WINRT
    QMAKE_CFLAGS += -Gy
}
qnx: DEFINES += _QNX_SOURCE
!win32:!winrt:!winphone: DEFINES += HAVE_USLEEP=1
integrity: QMAKE_CFLAGS += -include qplatformdefs.h
INCLUDEPATH +=  $$PWD/sqlcipher
HEADERS +=      $$PWD/sqlcipher/sqlite3.h
SOURCES +=      $$PWD/sqlcipher/sqlite3.c

INCLUDEPATH +=  $$PWD/libtomcrypt/src/headers
win32-msvc {
    QMAKE_LFLAGS_PLUGIN += "/NODEFAULTLIB:LIBCMT"
    LIBS += $$PWD/libtomcrypt/tomcrypt.lib
} else {
    LIBS += $$PWD/libtomcrypt/libtomcrypt.a
}
# The sqlite3.c produces too many warnings
# Comment the following line to turn them on
QMAKE_CFLAGS_WARN_ON=-w

TR_EXCLUDE += $$PWD/*
