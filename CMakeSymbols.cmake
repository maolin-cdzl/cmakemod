
function(add_symbols proj)
	#get_property(PROJ_TARGET TARGET ${proj} PROPERTY LOCATION)
	#target_compile_options(${proj} PRIVATE "-g")
	#add_custom_command(
	#	OUTPUT ${PROJ_TARGET}.sym
	#	COMMAND dump_syms ${PROJ_TARGET} > ${PROJ_TARGET}.sym
	#	DEPENDS ${proj}
	#	WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
	#	COMMENT "Generate symbols"
	#	)
	#
	#add_custom_target(${proj}-symbol ALL DEPENDS ${PROJ_TARGET}.sym)
	#install(CODE "execute_process(COMMAND install_symbols.py ${PROJ_TARGET}.sym ${CMAKE_INSTALL_PREFIX}/symbols)")
	add_custom_command(TARGET ${proj} POST_BUILD
		COMMAND dump_syms $<TARGET_FILE:${proj}> > $<TARGET_FILE:${proj}>.sym
		WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/symbols
		COMMENT "create symbols for ${proj}"
		)
endfunction(add_symbols)


function(install_symbols)
	file(MAKE_DIRECTORY ${CMAKE_INSTALL_PREFIX}/symbols)
	file(GLOB_RECURSE sym_files "*.sym")
	foreach(_sf ${sym_files})
		install(CODE "execute_process(COMMAND install_symbols.py ${_sf} ${CMAKE_INSTALL_PREFIX}/symbols)")
	endforeach()
endfunction()

