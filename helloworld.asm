.data 
	message: .asciiz "Hello world\n"      #assign var message to hello world
	
.text
	.globl main     #calling main label
	
main:
	li $v0, 4 #print
	la $a0, message
	syscall 
	li $v0, 10 #exit print
	syscall
	 
