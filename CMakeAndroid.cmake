set(CMAKE_SYSTEM_NAME Linux)

if($ENV{ANDROID_NDK_ROOT} STREQUAL "")
	message("Must special ANDROID_NDK_ROOT")
endif()

option(ANDROID_ARCH "android device arch" arm)
option(TOOLCHAIN_VERSION "android toolchain version" 4.8)
option(ANDROID_PLATFORM_VERSION "android platform version" 14)

set(ANDROID_NDK_ROOT $ENV{ANDROID_NDK_ROOT})
set(CROSS_PREFIX "arm-linux-androideabi-")
set(ANDROID_NDK_SYSROOT ${ANDROID_NDK_ROOT}/platforms/android-14/arch-arm)
set(ANDROID_NDK_TOOLCHAIN ${ANDROID_NDK_ROOT}/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64)
set(ANDROID_NDK_STL_ROOT ${ANDROID_NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.8)


set(CMAKE_C_COMPILER ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}g++)
set(CMAKE_OBJCOPY ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}objcopy)
set(CMAKE_OBJDUMP ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}objdump)
set(CMAKE_RANLIB ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}ranlib)
set(CMAKE_STRIP ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}strip)
set(CMAKE_AS ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}as)
set(CMAKE_AR ${ANDROID_NDK_TOOLCHAIN}/bin/${CROSS_PREFIX}ar)
#export CPP="${CROSS_PREFIX}gcc -E"

set(CMAKE_FIND_ROOT_PATH
	${ANDROID_NDK_ROOT}/platforms/android-14/arch-arm/usr/lib
	${ANDROID_NDK_STL_ROOT}/libs/armeabi-v7a
	)

include_directories(
	${ANDROID_NDK_ROOT}/platforms/android-14/arch-arm/usr/include
	${ANDROID_NDK_STL_ROOT}/include
	)

