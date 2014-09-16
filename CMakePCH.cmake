# 创建预编译头
# Target是用来生成预编译头的项目Target；PrecompiledHeader和PrecompiledSource分别是头文件的路径
MACRO(ADD_PRECOMPILED_HEADER
	Target PrecompiledHeader PrecompiledSource)
 
  IF(MSVC)
	ADD_MSVC_PRECOMPILED_HEADER(
		${Target} 
		${PrecompiledHeader}
		${PrecompiledSource})
  ENDIF(MSVC)
 
  IF(CMAKE_COMPILER_IS_GNUCXX)
	ADD_GCC_PRECOMPILED_HEADER(${Target} ${PrecompiledHeader})
  ENDIF(CMAKE_COMPILER_IS_GNUCXX)
ENDMACRO(ADD_PRECOMPILED_HEADER)
 
# 用于为visual studio生成pch
MACRO(ADD_MSVC_PRECOMPILED_HEADER PCH_TARGET PrecompiledHeader PrecompiledSource)
GET_FILENAME_COMPONENT(PCH_NAME ${PrecompiledHeader} NAME_WE)

# Compute a custom name for the precompiled header.
IF(CMAKE_CONFIGURATION_TYPES)
SET(PCH_DIR "${CMAKE_CURRENT_BINARY_DIR}/PCH/${CMAKE_CFG_INTDIR}")
ELSE(CMAKE_CONFIGURATION_TYPES)
SET(PCH_DIR "${CMAKE_CURRENT_BINARY_DIR}/PCH")
ENDIF(CMAKE_CONFIGURATION_TYPES)
FILE(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/PCH)

SET(PCH_FILE "/Fp\"${PCH_DIR}/${PCH_NAME}.pch\"")

SET_TARGET_PROPERTIES(${PCH_TARGET} PROPERTIES COMPILE_FLAGS
"/Yu\"${PrecompiledHeader}\" /FI\"${PrecompiledHeader}\" ${PCH_FILE}")

SET_SOURCE_FILES_PROPERTIES(${PrecompiledSource} PROPERTIES COMPILE_FLAGS
"/Yc\"${PrecompiledHeader}\"")

SET_DIRECTORY_PROPERTIES(PROPERTIES
ADDITIONAL_MAKE_CLEAN_FILES ${PCH_DIR}/${PCH_NAME}.pch
)


ENDMACRO(ADD_MSVC_PRECOMPILED_HEADER)
 
# 改函数用于判断gcc是否支持预编译头
IF(CMAKE_COMPILER_IS_GNUCXX)
  EXEC_PROGRAM(
	${CMAKE_CXX_COMPILER}
	ARGS					--version
	OUTPUT_VARIABLE _compiler_output)
  STRING(REGEX REPLACE ".* ([0-9]\\.[0-9]\\.[0-9]) .*" "\\1"
	gcc_compiler_version ${_compiler_output})
  #MESSAGE("GCC Version: ${gcc_compiler_version}")
  IF(gcc_compiler_version MATCHES "4\\.[0-9]\\.[0-9]")
	SET(PCHSupport_FOUND TRUE)
  ELSE(gcc_compiler_version MATCHES "4\\.[0-9]\\.[0-9]")
	IF(gcc_compiler_version MATCHES "3\\.4\\.[0-9]")
	  SET(PCHSupport_FOUND TRUE)
	ENDIF(gcc_compiler_version MATCHES "3\\.4\\.[0-9]")
  ENDIF(gcc_compiler_version MATCHES "4\\.[0-9]\\.[0-9]")
ENDIF(CMAKE_COMPILER_IS_GNUCXX)
 
MACRO(ADD_GCC_PRECOMPILED_HEADER TargetName PrecompileHeader)
  SET(_compile_FLAGS ${CMAKE_CXX_FLAGS})
 
  SET(_input "${CMAKE_CURRENT_SOURCE_DIR}/${PrecompileHeader}")
  MESSAGE("creating pch: ${_input}")
  GET_FILENAME_COMPONENT(_name ${_input} NAME)
  GET_FILENAME_COMPONENT(_path ${_input} PATH)
 
  # 根据不同的编译配置生成预编译头二进制文件的文件名，比如debug.c++, release.c++
  SET(_outdir "${CMAKE_CURRENT_BINARY_DIR}/${_name}.gch")
  IF(CMAKE_BUILD_TYPE)
	SET(_output "${_outdir}/${CMAKE_BUILD_TYPE}.c++")
	LIST(APPEND _compile_FLAGS ${CMAKE_CXX_FLAGS_${CMAKE_BUILD_TYPE}})
  ELSE(CMAKE_BUILD_TYPE)
	SET(_output "${_outdir}/default.c++")
  ENDIF(CMAKE_BUILD_TYPE)
 
  #  IF(${CMAKE_BUILD_TYPE} STREQUAL "DEBUG")
  #	LIST(APPEND _compile_FLAGS "-DQT_DEBUG")
  #  ENDIF()
 
  # 自动创建文件夹
  ADD_CUSTOM_COMMAND(
	OUTPUT ${_outdir}
	COMMAND mkdir ${_outdir} # TODO: {CMAKE_COMMAND} -E ...
	)
 
  GET_DIRECTORY_PROPERTY(_directory_flags INCLUDE_DIRECTORIES)
 
  # 确保生成预编译头的文件夹在所有包含目录的最前面
  SET(_CMAKE_CURRENT_BINARY_DIR_included_before_path FALSE)
  FOREACH(item ${_directory_flags})
	IF(${item}  STREQUAL ${_path} AND NOT
		_CMAKE_CURRENT_BINARY_DIR_included_before_path )
	  MESSAGE(FATAL_ERROR
		"This is the ADD_PRECOMPILED_HEADER macro. "
		"CMAKE_CURREN_BINARY_DIR has to mentioned at INCLUDE_DIRECTORIES's argument list before ${_path}, where ${_name} is located"
		)
	ENDIF(${item}  STREQUAL ${_path} AND NOT
	  _CMAKE_CURRENT_BINARY_DIR_included_before_path )
 
	IF(${item}  STREQUAL ${CMAKE_CURRENT_BINARY_DIR})
	  SET(_CMAKE_CURRENT_BINARY_DIR_included_before_path TRUE)
	ENDIF(${item}  STREQUAL ${CMAKE_CURRENT_BINARY_DIR})
 
	LIST(APPEND _compile_FLAGS "-I${item}")
  ENDFOREACH(item)
 
  GET_DIRECTORY_PROPERTY(_directory_flags DEFINITIONS)
  #LIST(APPEND _compile_FLAGS "-fPIC")
  LIST(APPEND _compile_FLAGS ${_directory_flags})
 
  SEPARATE_ARGUMENTS(_compile_FLAGS)
  #MESSAGE("_compiler_FLAGS: ${_compile_FLAGS}")
 
  # 拷贝头文件到binary目录
  ADD_CUSTOM_COMMAND(
	OUTPUT  ${CMAKE_CURRENT_BINARY_DIR}/${_name}
	COMMAND ${CMAKE_COMMAND} -E copy  ${_input}
	${CMAKE_CURRENT_BINARY_DIR}/${_name}
	)
 
  SET(PCH_PATH ${CMAKE_CURRENT_BINARY_DIR}/${_name} CACHE INTERNAL
	"the path of the precompiled header")
 
  #MESSAGE("command : ${CMAKE_COMMAND} -E copy  ${_input}
  #  ${CMAKE_CURRENT_BINARY_DIR}/${_name}")
 
  # 添加用于生成预编译头的命令
  ADD_CUSTOM_COMMAND(
	OUTPUT ${_output}
	COMMAND ${CMAKE_CXX_COMPILER}
	${_compile_FLAGS}
	-x c++-header
	-o ${_output}
	${_input}
	DEPENDS ${_input} ${_outdir} ${CMAKE_CURRENT_BINARY_DIR}/${_name}
	)
  ADD_CUSTOM_TARGET(${TargetName}_gch
	DEPENDS ${_output}
	)
  ADD_DEPENDENCIES(${TargetName} ${TargetName}_gch )
ENDMACRO(ADD_GCC_PRECOMPILED_HEADER)

