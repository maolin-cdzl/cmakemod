set( GPerfTools_FOUND 0 )

find_library( GPerfTools_LIBRARY
NAMES
	tcmalloc
	tcmalloc_minimal
	libtcmalloc
	libtcmalloc_minimal
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)

find_library( GPerfTools_LIBRARY_STATIC
NAMES
	libtcmalloc_and_profiler.a
	libtcmalloc.a
	libtcmalloc_minimal.a
	tcmalloc_and_profiler.lib
	tcmalloc.lib
	tcmalloc_minimal.lib
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)


if( GPerfTools_LIBRARY )
	set(GPerfTools_FOUND 1)
else( GPerfTools_LIBRARY )
	message(FATAL_ERROR "Count not find GPerfTools library!")
endif( GPerfTools_LIBRARY )

mark_as_advanced( GPerfTools_Found GPerfTools_LIBRARY GPerfTools_LIBRARY_STATIC)
