# Qt SQL driver plugin for SQLCipher ( for Qt 5 )

This is the experimental branch. The main difference from the other branches is
that it does not need the sqlcipher to be already installed, but it is included
in the 3rdparty folder. The cryptography backend is provided by libtomcrypt,
also included in the 3rdparty folder.

The sources for this plugin are based on the sqlite plugin from
[qt/qtbase](https://github.com/qt/qtbase/tree/5.14/src/plugins/sqldrivers/sqlite)

## Licences

For this plugin see [LICENCE](https://github.com/sjemens/qsqlcipher-qt5/blob/master/LICENSE) (**LGPLV3**)

[libtomcrypt](https://github.com/libtom/libtomcrypt/blob/develop/LICENSE) (**Public domain**)

[SQLCipher](https://www.zetetic.net/sqlcipher/license/) (**BSD**)

[Qt5 libraries](https://www.qt.io/licensing/) (**LGPLV3  GPLV2/GPLV3**)
