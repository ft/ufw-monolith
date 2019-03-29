cmake_minimum_required (VERSION 3.1.0)
project(ufw C CXX)

include(CTest)

set(EMBEDDED_CMAKE "${CMAKE_CURRENT_SOURCE_DIR}/ufw/cmake/modules")
list(APPEND CMAKE_MODULE_PATH "${EMBEDDED_CMAKE}")

include(Libtap)
add_libtap("${CMAKE_CURRENT_SOURCE_DIR}/test/libtap")

add_subdirectory(ufw)
