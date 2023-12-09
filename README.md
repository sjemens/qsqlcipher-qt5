# Qt SQL driver plugin for SQLCipher ( for Qt 6 )

This is for building with Qt version **6.6** using CMake.
To build for previous versions choose from the releases the one that
matches the system's Qt version, see https://github.com/sijk/qt5-sqlcipher
to build up to Qt 6.4.x

The sources for this plugin are based on the sqlite plugin from
[qt/qtbase](https://github.com/qt/qtbase/tree/6.6/src/plugins/sqldrivers/sqlite)

## Dependencies

This plugin is using the [SQLCipher](https://github.com/sqlcipher/sqlcipher) for
the encryption of database files. SQLCipher is included in the 3rdparty folder. 
The cryptography backend is provided by libtomcrypt, also included as a submodule in the
3rdparty folder.

## Build instructions 

```bash
git clone https://github.com/bAmpT/qsqlcipher-qt6-cmake
cd qsqlcipher-qt6-cmake
git submodule update --init --recursive  # to get the libtomcrypt submodule (develop branch)
mkdir -p build && cd build
cmake -S .. -B . -DCMAKE_BUILD_TYPE=Release
make
make install  # most propably with sudo
```

## Licenses

For this plugin see [LICENSE](https://github.com/bAmpT/qsqlcipher-qt6-cmake/LICENSE) (**LGPLV3**)

[libtomcrypt](https://github.com/libtom/libtomcrypt/blob/develop/LICENSE) (**Public domain**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
