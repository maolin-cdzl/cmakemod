#
# Find the ACE client includes and library
# 

# This module defines
# ACE_INCLUDE_DIR, where to find ace.h
# ACE_LIBRARIES, the libraries to link against
# ACE_FOUND, if false, you cannot build anything that requires ACE

# also defined, but not for general use are
# ACE_LIBRARY, where to find the ACE library.

set( ACE_FOUND 0 )

FIND_PATH( ACE_INCLUDE_DIR
NAMES
  ace/ACE.h
PATHS
  /usr/include
  /usr/local/include
  $ENV{ACE_ROOT}
  $ENV{ACE_ROOT}/include
DOC
"Specify include-directories that might contain ace.h here."
)

FIND_LIBRARY( ACE_LIBRARY 
NAMES
  ACE ace 
PATHS
  /usr/lib
  /usr/local/lib
  $ENV{ACE_ROOT}/lib
  $ENV{ACE_ROOT}
DOC "Specify library-locations that might contain the ACE library here."
)

if( ACE_LIBRARY )
    message("found: ${ACE_LIBRARY}")
    if ( ACE_INCLUDE_DIR )
        set( ACE_FOUND 1 )
    else ( ACE_INCLUDE_DIR )
        message(FATAL_ERROR "Could not find ACE headers! Please install ACE libraries and headers")
    endif ( ACE_INCLUDE_DIR )
else()
    message(FATAL_ERROR "Could not find ACE library! Please install ACE libraries and headers")
endif()

mark_as_advanced(ACE_FOUND ACE_LIBRARY ACE_INCLUDE_DIR)

