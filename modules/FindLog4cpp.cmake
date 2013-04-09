set( Log4cpp_FOUND 0 )

find_library( Log4cpp_LIBRARY
NAMES
	liblog4cpp
	log4cpp
	log4cppLib
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Release
	/usr/lib
	/usr/local/lib
	$ENV{LOG4CPP_LIB}
	$ENV{LOG4CPP_ROOT}/lib
)

find_library( Log4cpp_LIBRARY_STATIC
NAMES
	liblog4cpp.a
	log4cpp.lib
	log4cppLib.lib
PATHS
	${PTT_PUBLISH_LIB}
	${PTT_PUBLISH_LIB}/Debug
	/usr/lib
	/usr/local/lib
	$ENV{LOG4CPP_LIB}
	$ENV{LOG4CPP_ROOT}/lib
)

find_path( Log4cpp_INCLUDE_DIR
NAMES
	log4cpp/Category.hh
PATHS
	${PTT_PUBLISH_INC}
	${CMAKE_CURRENT_SOURCE_DIR}/log4cpp/include
	/usr/include
	/usr/local/include
	$ENV{LOG4CPP_ROOT}/include
)
if( Log4cpp_INCLUDE_DIR )
else( Log4cpp_INCLUDE_DIR )
	message(FATAL_ERROR "count find Log4cpp headers!")
endif( Log4cpp_INCLUDE_DIR )
	
if( Log4cpp_LIBRARY )
	set(Log4cpp_FOUND 1)
else( Log4cpp_LIBRARY )
	message(FATAL_ERROR "coun't find Log4cpp library!")
endif( Log4cpp_LIBRARY )

mark_as_advanced( Log4cpp_FOUND Log4cpp_LIBRARY Log4cppLIBRARY_STATIC Log4cpp_INCLUDE_DIR)


