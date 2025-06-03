cmake_minimum_required(VERSION 3.20)

project(b64)

add_library(${PROJECT_NAME} STATIC
    cencode.c 
    cdecode.c 
    b64/cdecode.h 
    b64/cencode.h 
    b64/cdecode.h
)

set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "libraries")

target_include_directories(${PROJECT_NAME} PUBLIC .)
