set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR "i686")

set(CMAKE_CXX_FLAGS        "${CMAKE_CXX_FLAGS} -m32" CACHE STRING "c++ flags")
set(CMAKE_C_FLAGS          "${CMAKE_C_FLAGS} -m32" CACHE STRING "c flags")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32" CACHE STRING "ld flags")