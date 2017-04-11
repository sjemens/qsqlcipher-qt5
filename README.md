# Qt SQL driver plugin for SQLCipher ( for Qt 5 )

Builds only on Qt **5.8.0** for now.
See https://github.com/sijk/qt5-sqlcipher to build up to Qt 5.7.x

You will need the SQLCipher headers and libraries installed before
compiling this plugin.

The qsqlcipher.pro and smain.cpp are based on files from qsqlite
 qtbase/src/plugins/sqldrivers/sqlite
The qsql_sqlite.cpp and qsql_sqlite_p.h were copied without
modifications from the same source.


## Build instructions

```bash
cd srcdir
mkdir -p build && cd build
qmake ../qsqlcipher-qt5.pro
make
make install  # most propably with sudo
```

Tested only on Archlinux (x64) and MSYS2 (x64) with sqlcipher 3.4.1
and Qt 5.8.0.


## Licences

sqlciher (**MIT**)

Qt libraries (**GPL3  LGPL3**)
