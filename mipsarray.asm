.data 
	numbers: .word 3, 5, 7 #array of size 3
	total: .word 0
	
.text
	la $a0, numbers
	lw $t0, 0($a0)
	lw $t1, 4($a0)
	lw $t2, 8($a0)
	
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	
	addi $s0, $t4, 67
	move $a0, $t0
	
	li $v0, 1
	
	syscall