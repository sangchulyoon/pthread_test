# Compile Option 

TOPDIR := $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

TARGET = pthread_test
OBJS = pthread_test1.o
LIBS = -lpthread -lm

INCLUDEDIR = 
LIBDIR = 

CROSS_PREFIX = 
CC = $(CROSS_PREFIX)gcc
CXX = $(CROSS_PREFIX)gcc
AR = $(CROSS_PREFIX)ar rc
AR2 = $(CROSS_PREFIX)ranlib
RANLIB = $(CROSS_PREFIX)ranlib
LD = $(CROSS_PREFIX)ld
NM = $(CROSS_PREFIX)nm
STRIP = $(CROSS_PREFIX)strip
OBJCOPY = $(CROSS_PREFIX)objcopy

SRCS = $(OBJS:.o=.c)

CFLAGS += $(INCLUDEDIRS)
CFLAGS += -Wall -O2 -g
CPPFLAGS += 
CXXFLAGS +=

INCLUDEDIRS += -I./ -I$(TOPDIR)/include -I$(CROSS_PREFIX)/include $(INCLUDEDIR)
LDFLAGS += -L./ -L$(TOPDIR)/lib -L$(CROSS_PREFIX)/lib $(LIBDIR)

#
# Compilation target for C files
#

%.o:%.c
	@echo "Compiling $< ..."
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -o $@ $<

#
# Compilation target for C++ files
#

%.o:%.cc
	@echo "C++ compiling $< ..."
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

all : $(TARGET) 

$(TARGET) : $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@ $(LIBS)
	# cp $(TARGET) /work/rfs/bin/

dep :
	$(CC) -M $(INCLUDEDIRS) $(SRCS) > .depend

clean : 
	rm -rf $(OBJS) $(TARGET) core

ifeq (.depend,$(wildcard .depend))
include .depend
endif
