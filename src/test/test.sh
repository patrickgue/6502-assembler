#!/bin/sh

TEST() {
    echo -n -e "$1\t"
    ../../bin/as65 -i $2 -o $3.test
    if cmp $3 $3.test; then
        echo "[SUCCESSFUL]";
        rm $3.test
    else
        echo -e "\n$1 test failed"
    fi
}

TEST zeropage zeropage.s zeropage.bin
TEST jump_offsets jmp_offs.s jmp_offs.bin 

