cmake_minimum_required (VERSION 3.9.0)
project(ufw NONE)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/ufw/cmake/modules)
include(SetupUFW)

ufw_toplevel(
  ROOT      ${CMAKE_SOURCE_DIR}/ufw
  ARTIFACTS ${CMAKE_BINARY_DIR}/artifacts)

ufw_add_board(posix
  TOOLCHAINS gnu clang
  BUILDTYPES Release Debug
  BUILDSYSTEM build-posix.cmake)

ufw_add_board(micro
  TOOLCHAINS gnu-arm-none-eabi
  BUILDTYPES Release Debug
  BUILDSYSTEM build-micro.cmake)

ufw_recursive_dispatch()
ufw_subtree_build()
