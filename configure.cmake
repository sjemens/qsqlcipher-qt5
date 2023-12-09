# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: BSD-3-Clause



#### Inputs

# input sqlite
set(INPUT_sqlite "undefined" CACHE STRING "")
set_property(CACHE INPUT_sqlite PROPERTY STRINGS undefined qt system)



#### Libraries

qt_find_package(SQLite3 PROVIDED_TARGETS SQLite::SQLite3 MODULE_NAME sqldrivers QMAKE_LIB sqlite3)
if(NOT WIN32 AND QT_FEATURE_system_zlib)
    qt_add_qmake_lib_dependency(sqlite3 zlib)
endif()


#### Tests



#### Features

qt_feature("sql-sqlite" PRIVATE
    LABEL "SQLite"
    CONDITION QT_FEATURE_datestring
)
qt_feature("system-sqlite" PRIVATE
    LABEL "  Using system provided SQLite"
    AUTODETECT OFF
    CONDITION QT_FEATURE_sql_sqlite AND SQLite3_FOUND
)

qt_configure_add_summary_section(NAME "Qt Sql Drivers")
qt_configure_add_summary_entry(ARGS "sql-sqlite")
qt_configure_add_summary_entry(ARGS "system-sqlite")
qt_configure_end_summary_section() # end of "Qt Sql Drivers" section
qt_configure_add_report_entry(
    TYPE WARNING
    MESSAGE "Qt does not support compiling the Oracle database driver with MinGW, due to lack of such support from Oracle. Consider disabling the Oracle driver, as the current build will most likely fail."
    CONDITION WIN32 AND NOT MSVC AND QT_FEATURE_sql_oci
)
