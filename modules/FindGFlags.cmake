set( GFlags_FOUND 0 )

find_library( GFlags_LIBRARY
NAMES
	gflags
	libgflags
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
	$ENV{GFLAGS_ROOT}
	$ENV{GFLAGS_ROOT}/lib
	$ENV{GFLAGS_ROOT}/Release
)

find_library( GFlags_LIBRARY_STATIC
NAMES
	libgflags.a
	gflags.lib
	libgflags-vs2010.lib
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Debug
	/usr/lib
	/usr/local/lib
	$ENV{GFLAGS_ROOT}
	$ENV{GFLAGS_ROOT}/lib
	$ENV{GFLAGS_ROOT}/Release
)

find_path( GFlags_INCLUDE_DIR
NAMES
	gflags/gflags.h
	gflags.h
PATHS
	${PTT_PUBLISH_INC}
	${CMAKE_CURRENT_SOURCE_DIR}/gflags/
	/usr/include
	/usr/local/include
	$ENV{GFLAGS_ROOT}/src/windows/gflags
)

if( GFlags_LIBRARY )
	if( GFlags_INCLUDE_DIR )
		set(GFlags_FOUND 1)
	else( GFlags_INCLUDE_DIR )
		message(FATAL_ERROR "count find gflags headers!")
	endif( GFlags_INCLUDE_DIR )

else( GFlags_LIBRARY )
	message(FATAL_ERROR "coun't find GFlags library!")
endif( GFlags_LIBRARY )

mark_as_advanced( GFlags_FOUND GFlags_LIBRARY GFlags_LIBRARY_STATIC GFlags_INCLUDE_DIR )

