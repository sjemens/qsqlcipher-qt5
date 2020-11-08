# Qt SQL driver plugin for SQLCipher ( for Qt 5 ) with android libs

This branch builds against the Qt **5.15.x** version

## Dependencies

The SQLCipher headers and libraries are included in the android-libs folder.
Those are build from https://github.com/sjemens/sqlcipher/tree/android.
See [README](https://github.com/sjemens/sqlcipher/blob/android/README.md) if you 
want to build your own

## Build instructions

Tested only with Qt Creator on windows 10.

First download the sources
```bash
git clone https://github.com/sjemens/qsqlcipher-qt5.git
git checkout android-5.15
```

and open the qsqlcipher.pro with Qt Creator. Choose the right toolchain and press build.

Finally copy the resulting libqsqlcipher.so to the QT_INSTALL_PLUGINS/sqldrivers folder.
Assuming Qt is installed in ~/Qt this would be something like ~/Qt/5.15.1/android_armv7a/plugins/sqldrivers


## Licenses

For this plugin see [LICENCE](https://github.com/sjemens/qsqlcipher-qt5/blob/android-5.15/LICENSE) (**LGPLV3**)

[OpenSSL](https://www.openssl.org/source/license.html) (**dual OpenSSL and SSLeay License**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
