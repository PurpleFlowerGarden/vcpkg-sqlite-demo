cmake_minimum_required(VERSION 3.25)

project(VcpkgSQLiteIntegrationDemo CXX)
enable_testing()

find_package(PkgConfig REQUIRED)
pkg_check_modules(glib REQUIRED IMPORTED_TARGET glib-2.0)
pkg_check_modules(gio REQUIRED IMPORTED_TARGET gio-2.0)
pkg_check_modules(gmodule REQUIRED IMPORTED_TARGET gmodule-2.0)
pkg_check_modules(gobject REQUIRED IMPORTED_TARGET gobject-2.0)
pkg_check_modules(gthread REQUIRED IMPORTED_TARGET gthread-2.0)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} demo.cpp)
target_link_libraries(${PROJECT_NAME} PUBLIC PkgConfig::glib PkgConfig::gio PkgConfig::gmodule PkgConfig::gobject PkgConfig::gthread)

add_test(NAME vcpkg-sqlite-demo COMMAND vcpkg-sqlite-demo COMMAND_EXPAND_LISTS)
set_property(TEST vcpkg-sqlite-demo PROPERTY ENVIRONMENT_MODIFICATION "PATH=path_list_prepend:${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}$<$<CONFIG:Debug>:/debug>/bin")
set_property(TEST vcpkg-sqlite-demo APPEND PROPERTY ENVIRONMENT_MODIFICATION "QT_PLUGIN_PATH=set:${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}$<$<CONFIG:Debug>:/debug>/Qt6/plugins")

if(UNIX)
   add_test(NAME ldd COMMAND ldd vcpkg-sqlite-demo COMMAND_EXPAND_LISTS)
endif(UNIX)
