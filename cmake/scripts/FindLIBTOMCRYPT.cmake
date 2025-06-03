set(TOMCRYPT_SUBMODULE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../libtomcrypt")

if(EXISTS "${TOMCRYPT_SUBMODULE_DIR}/CMakeLists.txt")
    add_subdirectory("${TOMCRYPT_SUBMODULE_DIR}" "${CMAKE_BINARY_DIR}/libtomcrypt_build")
    set(LIBTOMCRYPT_FOUND TRUE)
else()
    message(FATAL_ERROR "Could not find the libtomcrypt submodule in ${TOMCRYPT_SUBMODULE_DIR}.")
endif()