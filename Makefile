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

CFLAGS=-g -Wall
TARGET_ASM=bin/as65
TARGET_DASM=bin/das65
TARGET_TEST=bin/test

SRCS_ASM=src/assembler.c src/disassembler.c src/helper.c
SRCS_DASM=src/disassembler_cli.c src/disassembler.c src/helper.c
SRCS_TEST=src/test.c src/helper.c

OBJS_ASM=$(SRCS_ASM:.c=.o)
OBJS_DASM=$(SRCS_DASM:.c=.o)
OBJS_TEST=$(SRCS_TEST:.c=.o)


all: bin $(TARGET_ASM) $(TARGET_DASM)

bin:
	mkdir -p bin


$(TARGET_ASM):$(OBJS_ASM)
	$(CC) $(CFLAGS) -o $@ $^

$(TARGET_DASM):$(OBJS_DASM)
	$(CC) $(CFLAGS) -o $@ $^

$(TARGET_TEST):$(OBJS_TEST)
	$(CC) $(CFLAGS) -o $@ $^

%.o:%.c
	$(CC) $(CFLAGS) $^ -c -o $@


clean:
	rm -f $(TARGET_ASM) $(TARGET_DASM) $(OBJS_ASM) $(OBJS_DASM)


test: $(TARGET_TEST)
	./bin/test
	cd src/test && ./test.sh
