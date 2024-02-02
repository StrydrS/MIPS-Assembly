.data

    m1: .asciiz "Enter student test score: "
    newline: .asciiz "\n"
    avg: .word 0



.text
	
	la $a0, avg
	
	repeat:
		la $a0, m1
   		li $v0, 4
   		syscall
    		li $v0, 5
    		syscall
    		add $t0, $v0, $zero
	
		
		beq  $t0, $zero, end
		j repeat
		
			end: li $v0, 10
			syscall
	
