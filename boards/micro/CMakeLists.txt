cmake_minimum_required (VERSION 3.9.0)
project(board-micro C)

define_board(micro
  ARCHITECTURE cortex-m3
  CPUVENDOR    ST
  CPUFAMILY    f3
  CPUHANDLE    STM32F318C8
  DEFINITIONS  STM32F318xx
  SOURCES      src/board-init.c
  INCLUDE      ${CMAKE_CURRENT_SOURCE_DIR}/include)
