# Qt SQL driver plugin for SQLCipher ( for Qt 5 )

This branch builds against the Qt version **5.14**.
To build for previous versions choose from the releases the one that
matches the system's Qt version.
See https://github.com/sijk/qt5-sqlcipher to build up to Qt 5.5.x

The sources for this plugin are based on the sqlite plugin from
[qt/qtbase](https://github.com/qt/qtbase/tree/5.14/src/plugins/sqldrivers/sqlite)

## Dependencies

The SQLCipher headers and libraries should be installed **before**
compiling this plugin. Also, if pkg-config is not available you should
edit the qsqlcipher.pro and set the INCLUDEPATH and LIBS variables.


## Build instructions (without the tests)


```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake ../qsqlcipher.pro
# Or if the sqlcipher library was not built with the ENABLE_COLUMN_METADATA macro
# defined, disable it also for qsqlcipher. Replace the above qmake command with
# qmake ../qsqlcipher.pro DEFINES+=DISABLE_COLUMN_METADATA
make
make install  # most propably with sudo
```

Note: To check if the sqlcipher library was compiled with ENABLE_COLUMN_METADATA use
 PRAGMA compile_options;

Tested on Archlinux (x64) and MSYS2 (x64 only) with every Qt version after 5.8.0.


## Building and running the tests

```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake CONFIG+="withTests" ../qsqlcipher.pro
make
# in linux
./tests/qsqlcipher_test
# in windows (MSYS2-mingw) both the debug and release
# versions should have been built by default
# so we will check both of them
./tests/debug/qsqlcihper_test
./tests/release/qsqlcihper_test
# Unless you also want to install the tests change to 
# the lib folder
cd qsqlcipher
sudo make install
```

**Tip:** A quick way to find if the tested plugin is the newly built
and not the one in 'QT_INSTALL_PLUGINS' is to define the QT_DEBUG_PLUGINS
and check the loaded library path.
```bash
QT_DEBUG_PLUGINS=1 ./tests/qsqlcipher_test
```

### Specific instructions for Ubuntu 18.04 (Bionic Beaver)

Currently 'bionic beaver' comes with Qt 5.9.5

```bash
sudo apt-get update
sudo apt-get install -y \
 build-essential pkg-config libsqlcipher-dev qtbase5-private-dev
export QT_SELECT=5
wget https://github.com/sjemens/qsqlcipher-qt5/archive/v5.9.5-1.tar.gz
tar xf v5.9.5-1.tar.gz
cd qsqlcipher-qt5-5.9.5-1
mkdir -p build && cd build
qmake ../qsqlcipher.pro
make
sudo make install
```

Tested only inside an LXD container. If there are differences with a clean
installation, please let me know.

## Licences

For this plugin see [LICENCE](https://github.com/sjemens/qsqlcipher-qt5/blob/master/LICENSE) (**LGPLV3**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
