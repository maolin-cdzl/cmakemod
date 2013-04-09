set( Breakpad_FOUND 0 )

find_library( Breakpad_Client_LIBRARY
NAMES
	breakpad_client
	libbreakpad_client
PATHS
	${PTT_PUBLISH_LIB}
	${CMAKE_CURRENT_SOURCE_DIR}/breakpad
	/usr/lib
	/usr/local/lib
	$ENV{BREAKPAD_ROOT}
	$ENV{BREAKPAD_ROOT}/lib
)

find_library( Breakpad_Client_LIBRARY_STATIC
NAMES
	libbreakpad_client.a
	breakpad_client.lib
PATHS
	${PTT_PUBLISH_LIB}
	${CMAKE_CURRENT_SOURCE_DIR}/breakpad
	/usr/lib
	/usr/local/lib
	$ENV{BREAKPAD_ROOT}
	$ENV{BREAKPAD_ROOT}/lib
)

find_library( Breakpad_LIBRARY
NAMES
	breakpad
	libbreakpad
PATHS
	${PTT_PUBLISH_LIB}
	${CMAKE_CURRENT_SOURCE_DIR}/breakpad
	/usr/lib
	/usr/local/lib
	$ENV{BREAKPAD_ROOT}
	$ENV{BREAKPAD_ROOT}/lib
)

find_library( Breakpad_LIBRARY_STATIC
NAMES
	libbreakpad.a
	breakpad.lib
PATHS
	${PTT_PUBLISH_LIB}
	${CMAKE_CURRENT_SOURCE_DIR}/breakpad
	/usr/lib
	/usr/local/lib
	$ENV{BREAKPAD_ROOT}
	$ENV{BREAKPAD_ROOT}/lib
)

find_path( Breakpad_INCLUDE_DIR
NAMES
	client/linux/handler/exception_handler.h
	client/windows/handler/exception_handler.h
PATHS
	${PTT_PUBLISH_INC}
	${CMAKE_CURRENT_SOURCE_DIR}/breakpad/src
	$ENV{BREAKPAD_ROOT}/src
	$ENV{BREAKPAD_ROOT}
)

if( Breakpad_LIBRARY )
	if( Breakpad_INCLUDE_DIR )
		set(Breakpad_FOUND 1)
	else( Breakpad_INCLUDE_DIR )
		message("count find breakpad headers in:")
	endif( Breakpad_INCLUDE_DIR )

else( Breakpad_LIBRARY )
	message("coun't find breakpad library!")
endif( Breakpad_LIBRARY )

mark_as_advanced( Breakpad_FOUND Breakpad_LIBRARY Breakpad_Client_LIBRARY Breakpad_LIBRARY_STATIC Breakpad_Client_LIBRARY_STATIC Breakpad_INCLUDE_DIR )


