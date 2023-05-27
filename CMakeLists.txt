cmake_minimum_required(VERSION 3.24)

project(VcpkgSQLiteIntegrationDemo CXX)

find_package(SQLite3 REQUIRED)

add_executable(demo demo.cpp)
target_link_libraries(demo PUBLIC SQLite::SQLite3)