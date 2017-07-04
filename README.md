# Qt SQL driver plugin for SQLCipher ( for Qt 5 )

Builds on Qt >= **5.8.0**.
See https://github.com/sijk/qt5-sqlcipher to build up to Qt 5.5.x

You will need the SQLCipher headers and libraries installed before
compiling this plugin.

The qsqlcipher.pro and smain.cpp are based on files from qsqlite
 qtbase/src/plugins/sqldrivers/sqlite.
The qsql_sqlite.cpp and qsql_sqlite_p.h were copied without
modifications from the same source.


## Build instructions

```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake ../qsqlcipher-qt5.pro
make
make install  # most propably with sudo
```

Tested only on Archlinux (x64) and MSYS2 (x64) with sqlcipher 3.4.1
and Qt versions 5.8.0 and 5.9.0.


## Licences

For this plugin see LICENCE (**LGPLV3**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
