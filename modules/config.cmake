set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/modules)

set(CMAKE_C_FLAGS "" CACHE STRING "Ptt Common C Flags")
set(CMAKE_CXX_FLAGS "" CACHE STRING "Ptt Common CXX Flags")
set(CMAKE_SHARED_LINKER_FLAGS "" CACHE STRING "Ptt Common shared linker Flags")
set(CMAKE_EXE_LINKER_FLAGS "" CACHE STRING "Ptt Common exe linker Flags")

include(CheckCCompilerFlag)
check_c_compiler_flag(-std=c99 HAS_C99)
check_c_compiler_flag(-fPIC C_HAS_PIC)
check_c_compiler_flag(-g C_HAS_G)

include(CheckCXXCompilerFlag)
check_cxx_compiler_flag(-fPIC CXX_HAS_PIC)
check_cxx_compiler_flag(-pthread HAS_PTHREAD)
check_cxx_compiler_flag(-g CXX_HAS_G)
check_cxx_compiler_flag(-fshort-wchar HAS_SHORT_WCHAR)
check_cxx_compiler_flag(-Wall HAS_WARN_ALL)
check_cxx_compiler_flag(-Winvalid-pch HAS_WARN_INVALID_PCH)
#check_cxx_compiler_flag(-Wl,-rpath,./ HAS_RPATH)
check_cxx_compiler_flag(-Wl,--no-undefined HAS_NO_UNDEFINED)
check_cxx_compiler_flag(-std=c++0x HAS_STD_CPLUSPLUS_0x)
check_cxx_compiler_flag(-std=c++11 HAS_STD_CPLUSPLUS_11)
check_cxx_compiler_flag(-std=gnu++11 HAS_STD_GNU_PLUSPLUS_11)
check_cxx_compiler_flag(-std=gnu++0x HAS_STD_GNU_PLUSPLUS_0x)

#IF(ARCH32)
	#message("[+] build for arch 32")
	#set(CMAKE_C_FLAGS "-m32 ${CMAKE_C_FLAGS}")
	#set(CMAKE_CXX_FLAGS "-m32 ${CMAKE_CXX_FLAGS}") 
	#set(CMAKE_SHARED_LINKER_FLAGS "-m32 ${CMAKE_SHARED_LINKER_FLAGS}") 
	#set(CMAKE_EXE_LINKER_FLAGS "-m32 ${CMAKE_EXE_LINKER_FLAGS}") 
#ENDIF()

SET(CMAKE_INSTALL_RPATH "../lib")
#IF(HAS_RPATH)
#	message("[+] has -Wl,-rpath")
	#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-rpath,../lib")
	#set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-rpath,../lib")
#ENDIF()

IF(HAS_C99)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")
	message("[+] C compiler flag: -std=c99")
ENDIF()

IF(HAS_STD_GNU_PLUSPLUS_11)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")
	message("[+] CXX compiler flag: -std=gnu++11")
ELSE()
	IF(HAS_STD_CPLUSPLUS_11)
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
		message("[+] CXX compiler flag: -std=c++11")
	ELSE()
		IF(HAS_STD_GNU_PLUSPLUS_0x)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++0x")
			message("[+] CXX compiler flag: -std=gnu++0x")
		ELSE()
			IF(HAS_STD_CPLUSPLUS_0x)
				set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
				message("[+] CXX compiler flag: -std=c++0x")
			ENDIF()
		ENDIF()
	ENDIF()
ENDIF()


IF(C_HAS_G)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g")
	message("[+] C compiler flag: -g")
ENDIF()

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")

IF(CXX_HAS_G)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
	message("[+] CXX compiler flag: -g")
ENDIF()
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")

IF(C_HAS_PIC)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
	message("[+] C compiler flag: -fPIC")
ENDIF()

IF(CXX_HAS_PIC)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
	message("[+] CXX compiler flag: -fPIC")
ENDIF()

IF(HAS_PTHREAD)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
	set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -lpthread")
	message("[+] CXX compiler flag: -pthread")
ENDIF()
IF(HAS_NO_UNDEFINED)
	set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined")
	message("[+] CXX linker flag: -Wl,--no-undefined")
ENDIF()

#IF(HAS_SHORT_WCHAR)
#	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fshort-wchar")
#	message("[+] CXX compiler flag: -fshort-wchar")
#ENDIF()

IF(HAS_WARN_ALL)
	if( MSVC )
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /wd\"4819\" /wd\"4996\"")
	else( MSVC )
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-sign-compare -Wno-reorder")
	endif()
ENDIF()


IF(HAS_WARN_INVALID_PCH)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winvalid-pch")
ENDIF()

add_definitions(-D__STDC_LIMIT_MACROS)

if( MSVC )
	add_definitions(-DUNICODE -D_UNICODE)
endif()

function(add_symbols proj)
	get_property(PROJ_TARGET TARGET ${proj} PROPERTY LOCATION)
	add_custom_command(
		OUTPUT ${PROJ_TARGET}.sym
		COMMAND dump_syms ${PROJ_TARGET} > ${PROJ_TARGET}.sym
		#COMMAND strip --strip-debug ${PROJ_TARGET}
		DEPENDS ${proj}
		WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
		COMMENT "Generate symbols"
		)
	
	add_custom_target(${proj}-symbol ALL DEPENDS ${PROJ_TARGET}.sym)
	#install(FILES ${PROJ_TARGET}.sym DESTINATION ${CMAKE_INSTALL_PREFIX}/symbols)
	install(CODE "execute_process(COMMAND ${CMAKE_SOURCE_DIR}/install/script/dumpsyms.py ${PROJ_TARGET}.sym ${CMAKE_INSTALL_PREFIX}/symbols)")
endfunction(add_symbols)

