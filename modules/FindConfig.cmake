set( Config_FOUND 0 )

find_library( Config_LIBRARY
NAMES
	config
PATHS
	/usr/lib
	/usr/lib64
	/usr/local/lib
)

find_library( Config++_LIBRARY
NAMES
	config++
PATHS
	/usr/lib
	/usr/lib64
	/usr/local/lib
)

find_path( Config_INCLUDE_DIR
NAMES
	ev.h
	ev++.h
PATHS
	/usr/include
	/usr/include/libev
)

if( Config_LIBRARY )
	if( Config_INCLUDE_DIR )
		set(Config_FOUND 1)
	else( Config_INCLUDE_DIR )
		message("count find libev header files")
	endif( Config_INCLUDE_DIR )

else( Config_LIBRARY )
	message("coun't find libev library!")
endif( Config_LIBRARY )

mark_as_advanced( Config_FOUND Config_LIBRARY Config++_LIBRARY Config_INCLUDE_DIR )

