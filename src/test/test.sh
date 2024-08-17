#!/bin/sh

TEST() {
    echo -n -e "$1\t"
    ../../bin/as65 -i $2 -o $3.test
    cmp $3 $3.test || (echo -e "\n$1 test failed"; exit 1);
    rm $3.test
    echo "[SUCCESSFUL]"
}

TEST zeropage zeropage.s zeropage.bin
TEST jump_offsets jmp_offs.s jmp_offs.bin 

echo "ALL TESTS SUCCESSFUL"
