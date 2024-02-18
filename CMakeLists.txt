cmake_minimum_required(VERSION 3.24)

project(VcpkgSQLiteIntegrationDemo CXX)
enable_testing()

find_package(SQLite3 REQUIRED)

add_executable(vcpkg-sqlite-demo demo.cpp)
target_link_libraries(vcpkg-sqlite-demo PUBLIC SQLite::SQLite3)

add_test(NAME vcpkg-sqlite-demo COMMAND vcpkg-sqlite-demo COMMAND_EXPAND_LISTS)
