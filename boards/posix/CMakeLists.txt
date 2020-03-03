cmake_minimum_required(VERSION 3.9)
project(boards-posix C)

include(HardwareAbstraction)

define_board(posix
  ARCHITECTURE native
  SOURCES src/board-init.c
  INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/include)
