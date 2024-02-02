.data

    m1: .asciiz "how many numbers to print"
    num: .word 1
    num2: .word 40
    newline: .asciiz "\n"



.text

	#takes user input
	#m1: enter your number
	#fills $v0 with user input integer
	#$v0 moved to $t0 
	#n2: integer 2 loaded to register $t1

	lw $s0, num
	lw $s1, num2
	
	repeat:
		li $v0, 1
		move $a0, $s0
		syscall
		addi $s0, $s0, 1
		
		
		la $a0, newline
		li $v0, 4
		syscall
		
		blt $s0, $s1, repeat
			li $v0, 10
			syscall
	syscall