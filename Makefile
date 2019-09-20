#  Makefile  Makefile for several components of the project. See README
#  for more information.
#
#  Copyright (C) 2019 Patrick Günthard
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.

CFLAGS=-I./include/Z -I./include/6502 -g
#C65FLAGS=--target none --cpu 6502 -Cl

CC=clang
XA=./bin/as65
#CC65=cl65

TARGET_EMU="bin/emu"
EMU_CFLAGS=

TARGET_NEMU="bin/nemu"
NEMU_CFLAGS=-lncurses
TARGET_ASM="bin/as65"

SRCS_EMU=src/emu.c src/emulator.c src/romloader.c src/helper.c libsrc/6502.c
SRCS_NEMU=src/nemu.c src/emulator.c src/romloader.c src/helper.c libsrc/6502.c
SRCS_ASM=src/assembler.c src/helper.c

SYSSRCS=src/system/loader.s src/system/testprog.s
#SYSSRCS_C=src/system/testprogram.c

OBJS_EMU=$(SRCS_EMU:.c=.o)
OBJS_NEMU=$(SRCS_NEMU:.c=.o)
OBJS_ASM=$(SRCS_ASM:.c=.o)

SYSOBJS=$(SYSSRCS:.s=.o65)
#SYSOBJS_C=$(SYSSRCS_C:.c=.o65)

all:$(TARGET_EMU) $(TARGET_NEMU) $(TARGET_ASM) $(SYSOBJS) #$(SYSOBJS_C)
	cp $(SYSOBJS) src/system/loadrom.tbl ./bin

$(TARGET_EMU):$(OBJS_EMU) 
	$(CC) $(CFLAGS) $(EMU_CFLAGS) -o $@ $^


$(TARGET_NEMU):$(OBJS_NEMU)
	$(CC) $(CFLAGS) $(NEMU_CFLAGS) -o $@ $^



$(TARGET_ASM):$(OBJS_ASM)
	$(CC) $(CFLAGS) -o $@ $^


%.o:%.c
	$(CC) $(CFLAGS) $^ -c -o $@

#%.o65:%.c
#	$(CC65) $(C65FLAGS) $^ 
#	mv $(^:.c=) $@

%.o65:%.s 
	$(XA) $^ $@


clean:
	rm -f bin/* src/*.o src/system/*.o* libsrc/*.o *.tbl
