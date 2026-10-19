.data
so_not: .word 15
cao_do: .word 67,67,68,70,70,68,67,65,63,63,65,67,67,65,65
do_dai: .word 2,2,2,2,2,2,2,2,2,2,2,2,3,1,4
b:.word 0
space: .asciiz " "

str_dukien: .asciiz"Tong du kien (ms):"
str_doduoc:.asciiz "Thoi gian do duoc (ms):"
.text
main:
addi $t0,so_not,$zero