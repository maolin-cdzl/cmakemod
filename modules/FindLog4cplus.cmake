set( Log4cplus_FOUND 0 )

find_library(Log4cplus_LIBRARY
NAMES
	liblog4cplus
	log4cplus
	log4cplusLib
PATHS
	/usr/lib64
	/usr/lib
	/usr/local/lib
	$ENV{LOG4CPLUS_LIB}
	$ENV{LOG4CPLUS_ROOT}/lib
)

find_library( Log4cplus_LIBRARY_STATIC
NAMES
	liblog4cplus.a
	log4cplus.lib
	log4cplusLib.lib
PATHS
	/usr/lib64
	/usr/lib
	/usr/local/lib
	$ENV{LOG4CPLUS_LIB}
	$ENV{LOG4CPLUS_ROOT}/lib
)

find_path( Log4cplus_INCLUDE_DIR
NAMES
	log4cplus/logger.h
PATHS
	/usr/include
	/usr/local/include
	$ENV{LOG4CPLUS_ROOT}/include
)
if( Log4cplus_INCLUDE_DIR )
else( Log4cplus_INCLUDE_DIR )
	message(FATAL_ERROR "count find Log4cplus headers!")
endif( Log4cplus_INCLUDE_DIR )
	
if( Log4cplus_LIBRARY )
	set(Log4cplus_FOUND 1)
	message("Found Log4cplus at ${Log4cplus_LIBRARY}")
else( Log4cplus_LIBRARY )
	message(FATAL_ERROR "coun't find Log4cplus library!")
endif( Log4cplus_LIBRARY )

mark_as_advanced( Log4cplus_FOUND Log4cplus_LIBRARY Log4cplusLIBRARY_STATIC Log4cplus_INCLUDE_DIR)



