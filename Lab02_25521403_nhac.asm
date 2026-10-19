.data
so_not: .word 15
cao_do: .word 67,67,68,70,70,68,67,65,63,63,65,67,67,65,65
do_dai: .word 2,2,2,2,2,2,2,2,2,2,2,2,3,1,4,3
b:.word 0
space: .asciiz " "
newLine: .asciiz "\n"
str_dukien: .asciiz"Tong du kien (ms):"
str_doduoc:.asciiz "Thoi gian do duoc (ms):"
.text
main:
lw $t0, b
mul $t1,$t0,10
addi $t1,$t1,150
la $s1,cao_do
la $s2,do_dai
lw $t2,so_not
li $t3,0#bien i
li $t4,0#Thoi gian du kien
li $v0,30
syscall
move $s0,$a0
Loop:
beq  $t3,$t2, endL
lw $t5,0($s2)
lw $t6,0($s1)
mul $t7,$t5,$t1
add $t4,$t4,$t7
li $v0,1
move $a0,$t6
syscall
li $v0,4
la $a0,space
syscall
li $v0,1
move $a0,$t7
syscall
li $v0,4
la $a0,newLine
syscall
li $v0,31
move $a0,$t6
move $a1,$t7
li $a2,30
li $a3,100
syscall
li $v0,32
move $a0,$t7
syscall
addi $t3,$t3,1
addi $s2,$s2,4
addi $s1,$s1,4
j Loop
endL:
li $v0, 30
syscall
sub $t8,$a0,$s0
li $v0,4
la $a0,newLine
syscall
li $v0,4
la $a0,str_dukien
syscall
move $a0,$t4
li $v0,1
syscall
li $v0,4
la $a0,newLine
syscall
li $v0,4
la $a0,str_doduoc
syscall
move $a0,$t8
li $v0,1
syscall
li $v0,10
