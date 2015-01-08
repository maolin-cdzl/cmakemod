include(CheckCCompilerFlag)
check_c_compiler_flag(-std=c99 HAS_C99)
check_c_compiler_flag(-fPIC C_HAS_PIC)
check_c_compiler_flag(-Wall C_HAS_WARN_ALL)

IF(HAS_C99)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")
ENDIF()

IF(C_HAS_PIC)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
ENDIF()

IF(C_HAS_WARN_ALL)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
ENDIF()

add_definitions(-D__STDC_LIMIT_MACROS -D_GNU_SOURCE)
