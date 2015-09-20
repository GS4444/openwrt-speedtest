cmake_minimum_required(VERSION 2.6)
project(MyApp)

add_executable(bandwidth main.c)

INSTALL(TARGETS bandwidth RUNTIME DESTINATION /usr/bin/)
