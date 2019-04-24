# Qt SQL driver plugin for SQLCipher ( for Qt 5 )

This branch builds against the Qt version **5.9**.

The sources for this plugin are based on the sqlite plugin from
[qt/qtbase](https://github.com/qt/qtbase/tree/5.9/src/plugins/sqldrivers/sqlite)

## Dependencies

If this plugin is going to be linked with the system's sqlcipher, pass
CONFIG+=system-sqlcipher to qmake. In this case the SQLCipher headers
and libraries should be installed **before** compiling this plugin.
Also, if pkg-config is not available you should edit the qsqlcipher.pro
and set the INCLUDEPATH and LIBS variables to the right paths.

The other option is to build with the embedded sqlcipher and libtomcrypt
from the 3rdparty folder.

## Build instructions (without the tests)


```bash
git clone -b 5.9 https://github.com/sjemens/qsqlcipher-qt5.git
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
```sql
PRAGMA compile_options;
```
on the sqlcipher console.


## Building and running the tests

```bash
git clone -b 5.9 https://github.com/sjemens/qsqlcipher-qt5.git
cd qsqlcipher-qt5
mkdir -p build && cd build
qmake CONFIG+="withTests" ../qsqlcipher.pro
make
# in linux
./tests/qsqlcipher_test
# in windows (MSYS2-mingw) both the debug and release
# versions should have been built by default
# so we will check both of them
./tests/debug/qsqlcipher_test
./tests/release/qsqlcipher_test
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

### Specific instructions for Ubuntu 18.04 (Bionic Beaver) with system's Qt

Currently 'bionic beaver' comes with Qt 5.9.5

```bash
sudo apt-get update
sudo apt-get install -y build-essential qtbase5-private-dev
# Only if building with CONFIG+=system-sqlcipher, it is alse required
# sudo apt-get install -y pkg-config libsqlcipher-dev 
export QT_SELECT=5
# Follow the rest of building instructions as before
```

Tested only inside an LXD container. If there are differences with a clean
installation, please let me know.

## Licences

For this plugin see [LICENCE](https://github.com/sjemens/qsqlcipher-qt5/blob/master/LICENSE) (**LGPLV3**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
