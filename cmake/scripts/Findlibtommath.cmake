set(TOMMATH_SUBMODULE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../libtommath")

if(EXISTS "${TOMMATH_SUBMODULE_DIR}/CMakeLists.txt")
    add_subdirectory("${TOMMATH_SUBMODULE_DIR}" "${CMAKE_BINARY_DIR}/libtommath_build")
else()
    message(FATAL_ERROR "Could not find the libtommath submodule in ${TOMMATH_SUBMODULE_DIR}.")
endif()