cmake_minimum_required (VERSION 3.6.0)

project(zRIF)

add_library(${PROJECT_NAME} STATIC
    zRIF/keyflate.h
    zRIF/licdec.h
    zRIF/rif.h
    keyflate.c
    licdec.cpp
)
set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "libraries")

target_link_libraries(${PROJECT_NAME} zlibstatic b64)

target_include_directories(${PROJECT_NAME} PUBLIC .)