# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: BSD-3-Clause

cmake_minimum_required(VERSION 3.16)
if (NOT CMAKE_PROJECT_NAME STREQUAL "QtBase" AND NOT CMAKE_PROJECT_NAME STREQUAL "Qt")
    include(.cmake.conf)
    project(QSQLCipherDriverPlugin
        VERSION "${QT_REPO_MODULE_VERSION}"
        DESCRIPTION "Qt6 SQLCipher driver plugin"
        HOMEPAGE_URL "https://qt.io/"
        LANGUAGES CXX C ASM
    )
    find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS
        BuildInternals
        Core
        Sql
     )
    qt_prepare_standalone_project()
else()
    qt_internal_upgrade_cmake_policies()
endif()


set(CMAKE_OSX_DEPLOYMENT_TARGET 14.00)
set(CMAKE_VERBOSE_MAKEFILE ON)

# Currently handled completely manually.

# TODO sqldrivers_standalone {
#     _QMAKE_CACHE_ = $$shadowed($$SQLDRV_SRC_TREE)/.qmake.conf
#     load(qt_configure)
# }

qt_feature_module_begin(
    NO_MODULE
    PUBLIC_FILE "qtsqldrivers-config.h"
    PRIVATE_FILE "qtsqldrivers-config_p.h"
)
include(configure.cmake)
qt_feature_module_end(NO_MODULE)

set(WITH_LTM OFF CACHE BOOL "Build with support for libtommath" FORCE)
add_subdirectory(3rdparty/libtomcrypt)
add_subdirectory(qsqlcipher)

if(NOT CMAKE_PROJECT_NAME STREQUAL "QtBase" AND NOT CMAKE_PROJECT_NAME STREQUAL "Qt")
    qt_print_feature_summary()
endif()
