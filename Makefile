# Name: Makefile
# Project: uISP
# Author: Andrew 'Necromant' Andrianov
# Based on: (below)
# Project: Automator
# Author: Christian Starkjohann
# Creation Date: 2006-02-01
# Tabsize: 4
# Copyright: (c) 2006 by OBJECTIVE DEVELOPMENT Software GmbH
# License: Proprietary, free under certain conditions. See Documentation.
# This Revision: $Id: Makefile 281 2007-03-20 13:22:10Z cs $

# Please read the definitions below and edit them as appropriate for your
# system:

# Use the following 3 lines on Unix and Mac OS X:
USBFLAGS=   `libusb-config --cflags`
USBLIBS=    `libusb-config --libs`
EXE_SUFFIX=

# Use the following 3 lines on Windows and comment out the 3 above:
#USBFLAGS=
#USBLIBS=    -lhid -lusb -lsetupapi
#EXE_SUFFIX= .exe

CC=				clang -g
CXX=			g++
CFLAGS=			-O2 -Wall $(USBFLAGS) -g
LIBS=			$(USBLIBS)
ARCH_COMPILE=	
ARCH_LINK=		

DESTDIR=
PREFIX=/usr/local
PREFIXRULE=/lib/udev/rules.d

OBJ=		main.o usbcalls.o
PROGRAM=	uisptool$(EXE_SUFFIX)

all: $(PROGRAM)

$(PROGRAM): $(OBJ)
	$(CC) $(ARCH_LINK) $(CFLAGS) -o $(PROGRAM) $(OBJ) $(LIBS)

install: strip 10-uisp.rules
	install uisptool $(DESTDIR)/$(PREFIX)/bin/
	install uappmgr $(DESTDIR)/$(PREFIX)/bin/ 
	install 10-uisp.rules $(DESTDIR)/$(PREFIXRULE)/

deb:
	sudo checkinstall

strip: $(PROGRAM)
	strip $(PROGRAM)

clean:
	rm -f $(OBJ) $(PROGRAM)

.c.o:
	$(CC) $(ARCH_COMPILE) $(CFLAGS) -c $*.c -o $*.o
