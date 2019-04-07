# mingw-pthread-example
Probably the simplest example that should get you going with pthreads on MinGW

This is a nice start for a 'pthread' program written in C for MinGW. It even has the 'sleep' or 'nanosleep' working! You may want to take a peek into the Makefile to see that "-pthread  -DHAVE_STRUCT_TIMESPEC --std=gnu99" CFLAGS are essential in getting this thing to compile.
