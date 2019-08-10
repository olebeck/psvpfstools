rm build_mingw -r -f
mkdir build_mingw
cd build_mingw
cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../Toolchain-x86_64-w64-mingw32.cmake
make
cd ..
