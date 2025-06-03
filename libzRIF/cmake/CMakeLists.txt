cmake_minimum_required (VERSION 3.6.0)

project (libzRIF)

add_library(${PROJECT} STATIC ../zRIF/keyflate.h
                              ../zRIF/licdec.h
                              ../zRIF/rif.h
                              ../keyflate.c
                              ../licdec.cpp)
set_property(TARGET ${PROJECT} PROPERTY FOLDER "libraries")

target_link_libraries(${PROJECT} zlibstatic)

include_directories(..)
include_directories(../..)