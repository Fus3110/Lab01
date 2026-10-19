.data
loinhac:.asciiz "Nhap so kWh (0..9999):"
khople:.asciiz "Gia tri khong hop le, nhap lai."
dien:.asciiz "Tien dien:"
a:.asciiz "Nhap a:"
moc_dien:.word 50, 100, 200, 300, 400, 9999
don_gia:.word 1600, 1660, 1950, 2500, 2850, 3000
.text
    # $s0: Dia chi nen mang moc_dien
    # $s1: Dia chi nen mang don_gia
    # $t0: So kWh dien còn lai (ban dau là so kWh nhap vao)
    # $t1: Dung luong cua bac hien tai dang xet
    # $t2: Tong tien dien (cong don)
    # $t3: Moc dien truoc do (khoi tao = 0)
    # $t4, $t5, $t6, $t7,$t8: Các thanh ghi tính toán
main:	li $v0,4
	la $a0,loinhac
	syscall
	li $v0,5
	syscall
	sltiu $t4,$v0,10000
	beq $t4,$zero, Loopnhap
	move $t0,$v0
	li $v0,4
	la $a0,a
	syscall
	li $v0,5
	syscall
	move $t8,$v0
	mul $t8,$t8,20
	j calc
Loopnhap: li $v0,4
	la $a0,khople
	syscall
	j main
calc:   la $s0,moc_dien
	la $s1,don_gia
	li $t2,0
	li $t3,0
calc2:	beq $t0,$zero, print
	lw $t5,0($s0)
	lw $t6,0($s1)
	sub $t1,$t5,$t3
	add $t6,$t6,$t8
	blt $t0,$t1, behon
	mul $t7,$t1,$t6
	add $t2,$t2,$t7
	sub $t0,$t0,$t1
	addi $s0,$s0,4
	addi $s1,$s1,4
	move $t3,$t5
	j calc2
behon:	mul $t7,$t0,$t6
	add $t2,$t2,$t7
	addi $t0,$zero,0
	j calc2
print:	la $a0,dien
	li $v0,4
	syscall
	move $a0,$t2
	li $v0,1
	syscall
	li $v0,10
	syscall
