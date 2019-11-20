# Makefile Example

# *****************************************************
# Variables to control Makefile operation

CXX = g++
CXXFLAGS = -Wall -g

# ****************************************************
# Targets needed to bring the executable up to date

main: main.o Point.o Rectangle.o
	$(CXX) $(CXXFLAGS) -o main main.o Point.o Rectangle.o

# The main.o target can be written more simply

main.o: main.cpp Point.h Rectangle.h
	$(CXX) $(CXXFLAGS) -c main.cpp

Point.o: Point.h

Rectangle.o: Rectangle.h Point.h




#Variables Used By Built-in Rules
#-------------------------------------
#The built-in rules use a set of standard variables that allow you to specify local environment information (like where to find the ROOT include files) without re-writing all the rules. The ones most likely to be interesting to us are:
#	CC -- the C compiler to use
#	CXX -- the C++ compiler to use
#	LD -- the linker to use
#	CFLAGS -- compilation flag for C source files
#	CXXFLAGS -- compilation flags for C++ source files
#	CPPFLAGS -- flags for the c-preprocessor (typically include file paths and symbols defined on the command line), used by C and C++
#	LDFLAGS -- linker flags
#	LDLIBS -- libraries to link


CC=gcc
CXX=g++
RM=rm -f
CPPFLAGS=-g $(shell root-config --cflags)
LDFLAGS=-g $(shell root-config --ldflags)
LDLIBS=$(shell root-config --libs)

SRCS=tool.cc support.cc
OBJS=$(subst .cc,.o,$(SRCS))

all: tool

tool: $(OBJS)
    $(CXX) $(LDFLAGS) -o tool $(OBJS) $(LDLIBS)

tool.o: tool.cc support.hh

support.o: support.hh support.cc

clean:
    $(RM) $(OBJS)

distclean: clean
    $(RM) tool