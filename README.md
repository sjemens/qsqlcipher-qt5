# Qt SQL driver plugin for SQLCipher ( for Qt 5 )

The master branch builds against the Qt version **5.11.0**.
To build for previous versions choose from the releases the one that
matches the system's Qt version.
See https://github.com/sijk/qt5-sqlcipher to build up to Qt 5.5.x

The sources for this plugin are based on the sqlite plugin from
[qt/qtbase](https://github.com/qt/qtbase/tree/5.11/src/plugins/sqldrivers/sqlite)

## Dependencies

The SQLCipher headers and libraries should be installed **before**
compiling this plugin. Also, if pkg-config is not available you should
edit the qsqlcipher.pro and set the INCLUDEPATH and LIBS variables.


## Build instructions


```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake ../qsqlcipher-qt5.pro
# Or if the sqlcipher library was built with the ENABLE_COLUMN_METADATA macro
# defined, enable it also for qsqlcipher. Replace the above qmake command with
# qmake ../qsqlcipher-qt5.pro DEFINES+=ENABLE_COLUMN_METADATA
make
make install  # most propably with sudo
```

Tested on Archlinux (x64) and MSYS2 (x64 only) with every Qt version after 5.8.0.


## Licences

For this plugin see [LICENCE](https://github.com/sjemens/qsqlcipher-qt5/blob/master/LICENSE) (**LGPLV3**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
