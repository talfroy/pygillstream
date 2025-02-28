CC	= gcc -fPIC
CFLAGS	= -g  -Wall -Wsystem-headers -Wno-format-y2k -Wno-sign-compare -Wcast-align -Wmissing-prototypes -Wpointer-arith -Wreturn-type -Wswitch -Wshadow
COMPILE  = $(CC) $(CFLAGS) $(CPPFLAGS) $(INCLUDES)

LD	= gcc
LDFLAGS	= 
SOFLAGS =  -shared
RANLIB	= ranlib

SYS_LIBS= -lbz2 -lz 

INSTALL  = install

prefix   = /usr/local
exec_prefix = ${prefix}
bindir   = ${exec_prefix}/bin
libdir   = ${exec_prefix}/lib
includedir = ${prefix}/include

LIB_H	 = bgp_macros.h common.h
LIB_O	 = cfr_files.o mrt_entry.o circ_buffer.o

all: bgpgill libbgpgill.so

libbgpgill.a: $(LIB_H) $(LIB_O) makefile cfr_files.h
	ar r libbgpgill.a $(LIB_O)
	$(RANLIB) libbgpgill.a

libbgpgill.so: libbgpgill.a
	$(COMPILE) $(LDFLAGS) $(SOFLAGS) -o libbgpgill.so $(LIB_O) $(SYS_LIBS)

bgpgill: main.c libbgpgill.a
	$(COMPILE) $(LDFLAGS) -o bgpgill main.c libbgpgill.a $(SYS_LIBS)

clean:
	rm -f libbgpgill.so libbgpgill.a example bgpgill $(LIB_O)

install: all
	$(INSTALL) libbgpgill.so libbgpgill.a $(DESTDIR)$(libdir)
