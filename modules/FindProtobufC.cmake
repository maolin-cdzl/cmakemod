set( ProtobufC_FOUND 0 )

find_library( ProtobufC_LIBRARY
NAMES
	libprotobuf-c
	protobuf-c
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
	$ENV{PROTOBUF}
	$ENV{PROTOBUF}/lib
)

find_library( ProtobufC_LIBRARY_STATIC
NAMES
	libprotobuf-c.a
	protobuf-c.lib
	libprotobuf-c.lib
PATHS
	/usr/lib
	/usr/local/lib
	$ENV{PROTOBUF}
	$ENV{PROTOBUF}/lib
)

find_path( ProtobufC_INCLUDE_DIR
NAMES
	protobuf-c/protobuf-c.h
PATHS
	/usr/include
	/usr/include/google
	/usr/local/include
	/usr/local/include/google
	$ENV{PROTOBUF}/src
)

if( ProtobufC_LIBRARY )
	if( ProtobufC_INCLUDE_DIR )
		set(ProtobufC_FOUND 1)
	else( ProtobufC_INCLUDE_DIR )
		message(FATAL_ERROR "count find prorotbuf headers!")
	endif( ProtobufC_INCLUDE_DIR )

else( ProtobufC_LIBRARY )
	message(FATAL_ERROR "coun't find protobuf-c library!")
endif( ProtobufC_LIBRARY )

mark_as_advanced( ProtobufC_FOUND ProtobufC_LIBRARY ProtobufC_LIBRARY_STATIC ProtobufC_INCLUDE_DIR )


