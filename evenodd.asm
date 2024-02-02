.data

    m1: .asciiz "enter your first number: "
    n2: .word 2
    resulteven: .asciiz  "number is even"
    resultodd: .asciiz "number is odd"
    



.text

	#takes user input
	#m1: enter your number
	#fills $v0 with user input integer
	#$v0 moved to $t0 
	#n2: integer 2 loaded to register $t1
	
	la $a0, m1
   	li $v0, 4
   	syscall
    	li $v0, 5
   	syscall
   	move $t0, $v0
    	lw $t1, n2
    	
    	
    	#divides the number input by 2, remainder in hi register quotient in lo register
   	div $t0, $t1
   	
   	#moves hi register to $t2
   	mfhi $t2
   	
   	
   	#if t2 is equal to zero
   	beqz  $t2, LABEL1
   		la $a0, resultodd
   		li $v0, 4
   		syscall
   		j endif
   		
   	LABEL1: la $a0, resulteven
   		li $v0, 4
   		syscall
   		
   	
   	
  	endif: li $v0, 10
   	syscall
   	
   	
   	

	
