#INCLUDE(CMakeForceCompiler) #Disables checks
#SET(CMAKE_SYSTEM_NAME Linux)
#Generic removes -rdynamic from linker, which llvm-ld doesn't support

#CMAKE_FORCE_C_COMPILER( clang CLang )
#CMAKE_FORCE_CXX_COMPILER ( clang++ CLang )
SET(CMAKE_C_COMPILER "/usr/local/bin/clang")
SET(CMAKE_CXX_COMPILER "/usr/local/bin/clang++")
#SET(CMAKE_RANLIB "llvm-ranlib" CACHE INTERNAL STRING)
#SET(CMAKE_AR "llvm-ar" CACHE INTERNAL STRING)
#SET(CMAKE_OBJDUMP "llvm-objdump" CACHE INTERNAL STRING)
#SET(CMAKE_NM "llvm-nm" CACHE INTERNAL STRING)
#
#SET(CMAKE_LINKER "llvm-link" CACHE INTERNAL STRING)
#SET(CMAKE_C_LINKER "llvm-link")
#SET(CMAKE_CXX_LINKER "llvm-link")
#
#SET(CMAKE_C_LINK_EXECUTABLE "llvm-link <OBJECTS> -o  <TARGET> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES>")
#SET(CMAKE_CXX_LINK_EXECUTABLE "llvm-link <OBJECTS> -o  <TARGET> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES>")

set(CMAKE_CXX_STANDARD 11)

SET(CMAKE_FIND_ROOT_PATH "")
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


SET (CMAKE_C_FLAGS_INIT                "-Wall -std=gnu99")
SET (CMAKE_C_FLAGS_DEBUG_INIT          "-g")
SET (CMAKE_C_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
SET (CMAKE_C_FLAGS_RELEASE_INIT        "-O3 -DNDEBUG")
SET (CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-O2 -g")

SET (CMAKE_CXX_FLAGS_INIT                "-Wall")
SET (CMAKE_CXX_FLAGS_DEBUG_INIT          "-g")
SET (CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
SET (CMAKE_CXX_FLAGS_RELEASE_INIT        "-O3 -DNDEBUG")
SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2 -g")

SET(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES	"-lc++abi")

SET(CMAKE_C_FLAGS "-std=gnu99")
SET(CMAKE_CXX_FLAGS "-std=gnu++11 -stdlib=libc++")
