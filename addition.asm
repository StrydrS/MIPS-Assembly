.data
	prompt: .asciiz "Enter your name: "
    n1: .asciiz "enter your first number: "
    n2: .asciiz "enter your second number: "
    result: .asciiz  "result is "
    name: .space 10 #byte size, 80 bits 
    msg: .asciiz "Hello "

.text

main:
	#getting name
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 8	
	la $a0, name 
	li $a1, 10 #number of input characters
	syscall
	
    #getting first input.
    la $a0, n1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    #getting second input.
    la $a0, n2
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    #calculate and print out the result.
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 4
    la $a0, name
    syscall
    la $a0, result
    li $v0, 4
    syscall
    add $t3, $t0, $t1
    move $a0, $t3
    li $v0, 1
    syscall

    #end program.
    li $v0, 10
    syscall