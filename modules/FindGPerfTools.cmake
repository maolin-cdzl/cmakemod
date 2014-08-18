set( GPerfTools_FOUND 0 )


find_library( tcmalloc_LIBRARY
NAMES
	tcmalloc
	libtcmalloc
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)

find_library( tcmalloc_LIBRARY_STATIC
NAMES
	libtcmalloc.a
	tcmalloc.lib
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)

find_library( tcmalloc_minimal_LIBRARY
NAMES
	tcmalloc_minimal
	libtcmalloc_minimal
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)

find_library( tcmalloc_minimal_LIBRARY_STATIC
NAMES
	libtcmalloc_minimal.a
	tcmalloc_minimal.lib
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)

find_library( tcmalloc_and_profiler_LIBRARY
NAMES
	tcmalloc_and_profiler
	libtcmalloc_and_profiler
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)

find_library( tcmalloc_and_profiler_LIBRARY_STATIC
NAMES
	libtcmalloc_and_profiler.a
	tcmalloc_and_profiler.lib
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{GPERFTOOLS}
	$ENV{GPERFTOOLS}/lib
)


if( tcmalloc_LIBRARY )
	set(GPerfTools_FOUND 1)
else( tcmalloc_LIBRARY )
	message(FATAL_ERROR "Count not find GPerfTools library!")
endif( tcmalloc_LIBRARY )

mark_as_advanced( GPerfTools_Found tcmalloc_LIBRARY tcmalloc_LIBRARY_STATIC tcmalloc_minimal_LIBRARY tcmalloc_minimal_LIBRARY tcmalloc_and_profiler_LIBRARY tcmalloc_and_profiler_LIBRARY_STATIC )
