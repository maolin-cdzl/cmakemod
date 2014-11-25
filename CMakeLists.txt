CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT(cmakemod)

set(BIN_FILES install_symbols.py)
set(MOD_FILES CMakePCH.cmake CMakeSymbols.cmake CMakeProtobuf.cmake CMakeCStdOpt.cmake CMakeCxxStdOpt.cmake)

install(PROGRAMS ${BIN_FILES} DESTINATION /usr/local/bin)

install(FILES ${MOD_FILES} DESTINATION ${CMAKE_ROOT}/Modules)


