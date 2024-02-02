.data 
	prompt1: .asciiz "Enter number 1: "
	prompt2: .asciiz "Enter number 2: "
	msg: .asciiz "Sum of two numbers is: "
		
.text
	#print enter num1
	li $v0, 4
	la $a0, prompt1
	
	syscall
	
	#take int as input
	li $v0, 5
	
	syscall
	
	move $s0, $v0
	
	
	
	
	
	li $v0, 4
	la $a0, prompt2
	
	syscall
	
	li $v0, 5
	syscall
	
	move $s1, $v0

	
	
	
	addu $s0, $s1, $s0
	li $v0, 4
	la $a0, msg
	syscall
	
	
	li $v0, 1
	move $a0, $s0
	
	syscall
	
	li $v0, 10
	syscall
	
	