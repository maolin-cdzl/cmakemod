CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT(cmakemod)

find_file(DUMP_SYMS_TOOLS
	NAMES dump_syms
	PATHS 
		/usr/local/bin
		/usr/bin
	)

if (NOT DUMP_SYMS_TOOLS)
	message(FATAL_ERROR "Should install google breakpad.")
endif()

set(BIN_FILES install_symbols.py)
set(MOD_FILES CMakePCH.cmake CMakeSymbols.cmake CMakeProtobuf.cmake CMakeStdOpt.cmake)

install(PROGRAMS ${BIN_FILES} DESTINATION /usr/local/bin)

install(FILES ${MOD_FILES} DESTINATION ${CMAKE_ROOT}/Modules)


