set(TOMCRYPT_SUBMODULE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../libtomcrypt")

if(EXISTS "${TOMCRYPT_SUBMODULE_DIR}/CMakeLists.txt")
    add_subdirectory("${TOMCRYPT_SUBMODULE_DIR}" "${CMAKE_BINARY_DIR}/libtomcrypt_build")
    set(LIBTOMCRYPT_FOUND TRUE)
else()
    message(FATAL_ERROR "Could not find the Zlib submodule in ${ZLIB_SUBMODULE_DIR}.")
endif()