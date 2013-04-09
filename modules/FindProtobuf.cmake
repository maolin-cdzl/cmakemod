set( Protobuf_FOUND 0 )

find_library( Protobuf_LIBRARY
NAMES
	libprotobuf
	protobuf
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
	$ENV{PROTOBUF}
	$ENV{PROTOBUF}/lib
)

find_library( Protobuf_LIBRARY_STATIC
NAMES
	libprotobuf.a
	protobuf.lib
	libprotobuf.lib
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Debug
	/usr/lib
	/usr/local/lib
	$ENV{PROTOBUF}
	$ENV{PROTOBUF}/lib
)

find_path( Protobuf_INCLUDE_DIR
NAMES
	google/protobuf/message.h
PATHS
	${PTT_PUBLISH_INC}
	${CMAKE_CURRENT_SOURCE_DIR}/protobuf/src
	/usr/include
	/usr/local/include
	$ENV{PROTOBUF}/src
)

if( Protobuf_LIBRARY )
	if( Protobuf_INCLUDE_DIR )
		set(Protobuf_FOUND 1)
	else( Protobuf_INCLUDE_DIR )
		message(FATAL_ERROR "count find prorotbuf headers!")
	endif( Protobuf_INCLUDE_DIR )

else( Protobuf_LIBRARY )
	message(FATAL_ERROR "coun't find protobuf library!")
endif( Protobuf_LIBRARY )

mark_as_advanced( Protobuf_FOUND Protobuf_LIBRARY Protobuf_LIBRARY_STATIC Protobuf_INCLUDE_DIR )

