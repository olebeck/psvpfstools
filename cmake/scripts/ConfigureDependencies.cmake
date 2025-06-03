macro(configure_zlib)
    message("configuring zlib")

    if (MSVC)
    set (CMAKE_EXE_LINKER_FLAGS "/SAFESEH:NO")
    endif()

    find_package(ZLIB REQUIRED)
endmacro(configure_zlib)


macro(configure_json)
    set(NLOHMANN_JSON_URL "https://raw.githubusercontent.com/nlohmann/json/refs/heads/develop/single_include/nlohmann/json.hpp")
    set(NLOHMANN_JSON_DEST "${CMAKE_BINARY_DIR}/include/nlohmann/json.hpp")
    if(NOT EXISTS ${NLOHMANN_JSON_DEST})
        message(STATUS "Downloading nlohmann/json.hpp from ${NLOHMANN_JSON_URL}")
        file(DOWNLOAD ${NLOHMANN_JSON_URL} ${NLOHMANN_JSON_DEST} STATUS download_status SHOW_PROGRESS)
        
        list(GET download_status 0 status_code)
        if(NOT status_code EQUAL 0)
            message(FATAL_ERROR "Failed to download nlohmann/json.hpp. Status code: ${status_code}")
        endif()
    endif()
    include_directories("${CMAKE_BINARY_DIR}/include")
endmacro(configure_json)

macro(configureCLI11)
    set(CLI11_URL "https://github.com/CLIUtils/CLI11/releases/download/v2.4.2/CLI11.hpp")
    set(CLI11_DEST "${CMAKE_BINARY_DIR}/include/CLI11.hpp")
    if(NOT EXISTS ${CLI11_DEST})
        message(STATUS "Downloading CLI11.hpp from ${CLI11_URL}")
        file(DOWNLOAD ${CLI11_URL} ${CLI11_DEST} STATUS download_status SHOW_PROGRESS)
        
        list(GET download_status 0 status_code)
        if(NOT status_code EQUAL 0)
            message(FATAL_ERROR "Failed to download nlohmann/json.hpp. Status code: ${status_code}")
        endif()
    endif()
endmacro(configureCLI11)


macro(configure_libtomcrypt)

if (MSVC)
set(LIBTOMCRYPT_INCLUDE_DIR "$ENV{LIBTOMCRYPT_INCLUDE_DIR}")
set(LIBTOMCRYPT_LIBRARY "$ENV{LIBTOMCRYPT_LIBRARY}")
endif()

find_package(LIBTOMCRYPT REQUIRED)

add_definitions(-DLTC_NO_PROTOTYPES)

endmacro(configure_libtomcrypt)