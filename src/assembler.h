/*
  assembler.h  Headerfile for assembler.c
  Copyright (C) 2019 Patrick Günthard

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
#ifndef ASSEMBLER_H
#define ASSEMBLER_H

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

addressing_information calc_addressing_information(char*, bool);

size_t construct_binopt(char*, uint8_t **, bool);

uint16_t parse_number(char*, addressing_mode);

line_type get_line_type(char *line);

void add_label(char *, uint16_t, bool);

char *add_label_reference(char *, uint16_t);

char *remove_comment(char *);


static char implied_ops[26][4] = {"BRK", "RTI", "RTS", "PHP", "CLC", "PLP", "SEC", "PHA", "CLI", "PLA", "SEI", "DEY", "TYA", "TAY", "CLV", "INY", "CLD", "INX", "SED", "TXA", "TXS", "TAX", "TSX", "DEX", "NOP"};
static int implied_ops_count = 26;

bool is_implied_addr_op(char *);

static char accum_ops[4][4] = {"ASL", "ROL", "LSR", "ROR"};
static int accum_ops_count = 4;

bool is_accum_addr_op(char *);

static char relative_ops[8][4] = {"BPL", "BMI", "BVC", "BVS", "BCC", "BCS", "BNE", "BEQ"};
static int relative_ops_count = 8;

bool is_relative_addr_op(char *);

static char force_word_ops[2][4] = {"JMP", "JSR"};
static int force_word_ops_count = 2;

bool is_force_word_op(char *);

static char pseudo_ops[5][6] = {".pc", ".org", ".byte", ".word", ".str"};
static int pseudo_ops_size = 5;

#endif
