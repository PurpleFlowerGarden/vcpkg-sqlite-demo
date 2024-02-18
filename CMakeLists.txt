cmake_minimum_required(VERSION 3.24)

project(VcpkgSQLiteIntegrationDemo CXX)

find_package(SQLite3 REQUIRED)

add_executable(vcpkg-sqlite-demo demo.cpp)
target_link_libraries(vcpkg-sqlite-demo PUBLIC SQLite::SQLite3 Threads::Threads)
