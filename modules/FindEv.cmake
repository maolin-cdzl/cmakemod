set( Ev_FOUND 0 )

find_library( Ev_LIBRARY
NAMES
	ev
PATHS
	/usr/lib
	/usr/lib64
	/usr/local/lib
)

find_library( Ev++_LIBRARY
NAMES
	ev++
PATHS
	/usr/lib
	/usr/lib64
	/usr/local/lib
)

find_path( Ev_INCLUDE_DIR
NAMES
	ev.h
	ev++.h
PATHS
	/usr/include
	/usr/include/libev
)

if( Ev_LIBRARY )
	if( Ev_INCLUDE_DIR )
		set(Ev_FOUND 1)
	else( Ev_INCLUDE_DIR )
		message("count find libev header files")
	endif( Ev_INCLUDE_DIR )

else( Ev_LIBRARY )
	message("coun't find libev library!")
endif( Ev_LIBRARY )

mark_as_advanced( Ev_FOUND Ev_LIBRARY Ev++_LIBRARY Ev_INCLUDE_DIR )



