
include(CheckCCompilerFlag)
check_c_compiler_flag(-std=c99 HAS_C99)
check_c_compiler_flag(-fPIC C_HAS_PIC)
check_c_compiler_flag(-Wall C_HAS_WARN_ALL)

IF(HAS_C99)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")
	message("[+] C compiler flag: -std=c99")
ENDIF()

IF(C_HAS_PIC)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
	message("[+] C compiler flag: -fPIC")
ENDIF()

IF(C_HAS_WARN_ALL)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
	message("[+] C compiler flag: -Wall")
ENDIF()

include(CheckCXXCompilerFlag)
check_cxx_compiler_flag(-std=c++0x HAS_STD_CPLUSPLUS_0x)
check_cxx_compiler_flag(-std=c++11 HAS_STD_CPLUSPLUS_11)
check_cxx_compiler_flag(-std=gnu++11 HAS_STD_GNU_PLUSPLUS_11)
check_cxx_compiler_flag(-std=gnu++0x HAS_STD_GNU_PLUSPLUS_0x)
check_cxx_compiler_flag(-fPIC CXX_HAS_PIC)
check_cxx_compiler_flag(-Wall HAS_WARN_ALL)

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

IF(CXX_HAS_PIC)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
	message("[+] CXX compiler flag: -fPIC")
ENDIF()

IF(HAS_WARN_ALL)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-sign-compare -Wno-reorder")
ENDIF()

add_definitions(-D__STDC_LIMIT_MACROS -D_GNU_SOURCE)
