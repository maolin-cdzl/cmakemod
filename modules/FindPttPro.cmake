set( PttPro_FOUND 0 )

find_library( PttPro_LIBRARY
NAMES
	libpttpro
	pttpro
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
)

find_library( PttPro_LIBRARY_STATIC
NAMES
	libpttpro.a
	pttpro.lib
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Debug
	/usr/lib
	/usr/local/lib
)

find_path( PttPro_INCLUDE_DIR
NAMES
	pttpro/interface.h
PATHS
	${PTT_PUBLISH_INC}
	${CMAKE_SOURCE_DIR}
	/usr/include
	/usr/local/include
)

if( PttPro_LIBRARY )
	if( PttPro_INCLUDE_DIR )
		set(PttPro_FOUND 1)
	else( PttPro_INCLUDE_DIR )
		message(FATAL_ERROR "count find PttPro headers!")
	endif( PttPro_INCLUDE_DIR )

else( PttPro_LIBRARY )
	message(FATAL_ERROR "coun't find PttPro library!")
endif( PttPro_LIBRARY )

mark_as_advanced( PttPro_FOUND PttPro_LIBRARY PttPro_LIBRARY_STATIC PttPro_INCLUDE_DIR )



