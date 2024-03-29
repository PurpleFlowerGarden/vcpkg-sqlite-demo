cmake_minimum_required(VERSION 3.25)

project(VcpkgSQLiteIntegrationDemo CXX)
enable_testing()

find_package(SQLite3 REQUIRED)
find_package(Threads REQUIRED)

add_executable(vcpkg-sqlite-demo demo.cpp)
target_link_libraries(vcpkg-sqlite-demo PUBLIC SQLite::SQLite3 Threads::Threads)

add_test(NAME vcpkg-sqlite-demo COMMAND vcpkg-sqlite-demo COMMAND_EXPAND_LISTS)
set_property(TEST vcpkg-sqlite-demo PROPERTY ENVIRONMENT_MODIFICATION "PATH=path_list_prepend:${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}$<$<CONFIG:Debug>:/debug>/bin")
set_property(TEST vcpkg-sqlite-demo APPEND PROPERTY ENVIRONMENT_MODIFICATION "QT_PLUGIN_PATH=set:${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}$<$<CONFIG:Debug>:/debug>/Qt6/plugins")

if(UNIX)
   add_test(NAME ldd COMMAND ldd vcpkg-sqlite-demo COMMAND_EXPAND_LISTS)
endif(UNIX)
