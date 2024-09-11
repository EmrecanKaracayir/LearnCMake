# Specify the minimum required version of CMake to build the project
cmake_minimum_required(VERSION 3.30)

# Specify the name of the project
project(Chapter03 VERSION 1.0.0 LANGUAGES CXX)

# Add an executable target called Chapter03
add_executable(Chapter03 source/Chapter03/main.cpp)
