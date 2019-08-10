# - Try to find LIBTOMCRYPT
# Specify the following variables to help the search:
# LIBTOMCRYPT_INCLUDE_DIR - include directory path
# LIBTOMCRYPT_LIBRARY - library file path
# After search - these variables will be set:
# LIBTOMCRYPT_FOUND - System has LIBTOMCRYPT
# LIBTOMCRYPT_INCLUDE_DIRS - The LIBTOMCRYPT include directories
# LIBTOMCRYPT_LIBRARIES - The libraries needed to use LIBTOMCRYPT

find_path(LIBTOMCRYPT_INCLUDE_DIR "tomcrypt.h")
set(LIBTOMCRYPT_INCLUDE_DIRS ${LIBTOMCRYPT_INCLUDE_DIR})

find_library(LIBTOMCRYPT_LIBRARY tomcrypt)
set(LIBTOMCRYPT_LIBRARIES ${LIBTOMCRYPT_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIBTOMCRYPT DEFAULT_MSG LIBTOMCRYPT_LIBRARY LIBTOMCRYPT_INCLUDE_DIR)

mark_as_advanced(LIBTOMCRYPT_INCLUDE_DIR LIBTOMCRYPT_LIBRARY)