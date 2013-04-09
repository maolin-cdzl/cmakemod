SET(CMAKE_SYSTEM_NAME iOS)
SET(CMAKE_SYSTEM_VERSION 11)

SET(CMAKE_C_COMPILER /usr/local/bin/ios-clang)
SET(CMAKE_CXX_COMPILER /usr/local/bin/ios-clang++)
SET(CMAKE_FIND_ROOT_PATH /Developer/iOS/iPhoneOS5.0.sdk)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -objc-arc -fblocks -g0 -O2 -DIOS")
SET(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -objc-arc -fblocks -g0 -O2 -DIOS")

