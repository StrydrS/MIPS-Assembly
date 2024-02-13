.data 
	prompt1: .asciiz "Enter number to calculate if prime: "
	msg: .asciiz "Number is not prime. \n "
	msg2: .asciiz "Number is prime. \n"
		
.text
	#print enter num1
	li $v0, 4
	la $a0, prompt1
	
	syscall
	
	#take int as input
	li $v0, 5
	
	syscall
	
	move $t0, $v0
	
    	li $t1, 1           # initialize loop counter to 1
    	
    	main_loop:
    	beq $t3, 1 , prime #if t3(quotient of division) is 1, the number is prime
    	addi $t1, $t1, 1 #add 1 to the loop counter
        div $t0, $t1 #divide input by loop counter
        mfhi $t2 #remainder
        mflo $t3 #quotient
        beqz $t2, notprime #if remainder is 0, number is not prime
        bnez $t2, main_loop #if the remainder is not 0, loop again and divide by new loop counter
    
    	notprime:
    	li $v0, 4
    	la $a0, msg
   	syscall
   	li $v0, 10          # syscall for exit
    	syscall
    	
    	prime:
    	li $v0, 4
    	la $a0, msg2
   	syscall
   	li $v0, 10          # syscall for exit
    	syscall
    	

   	