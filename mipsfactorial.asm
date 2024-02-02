.data 
	prompt1: .asciiz "Enter number to calculate factorial: "
	msg: .asciiz "Factorial is: "
	newline: .asciiz "\n"
		
.text
	#print enter num1
	li $v0, 4
	la $a0, prompt1
	
	syscall
	
	#take int as input
	li $v0, 5
	
	syscall
	
	move $t0, $v0
	
	li $t1, 1           # initialize result to 1
    	li $t2, 1           # initialize loop counter to 1
    	
    	factorial_loop:
        addi $t2, $t2, 1               # increment counter
        mul $t1, $t1, $t2              # multiply result by counter
        blt $t2, $t0, factorial_loop
    
    	# Display the result
   	 li $v0, 4
    	 la $a0, msg
   	 syscall

  	 li $v0, 1
    	 move $a0, $t1       # load the result into $a0
   	 syscall

    	# Print newline
    	li $v0, 4           # syscall for print_str
    	la $a0, newline      # load address of newline string
    	syscall

   	# Exit the program
   	li $v0, 10          # syscall for exit
    	syscall