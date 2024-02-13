.data
	array: .word   9, 4, 2, 3, 7, 6, 8, 1, 2
	space: .asciiz " "
	newline: .asciiz "\n"


.text

.globl main

main:
	la $a0, array
	li $a1, 1	#flag to indicate if swap occured
	li $a2, 0	#init index counter
	
loop:
	li $t3, 0               # Reset swap flag
	la $t4, array           # Reset address of the array
	addi $t5, $t4, 4        # Reset pointer to next element
	li $t2, 0     
	
swap_loop:
	lw $t6, 0($t4)          # Load array[i]
    	lw $t7, 0($t5)          # Load array[i+1]
    	ble $t6, $t7, no_swap   # If array[i] <= array[i+1], no swap needed

    	sw $t7, 0($t4)          # Swap array[i] and array[i+1]
    	sw $t6, 0($t5)

    	li $t3, 1               # Set swap flag

no_swap:
    addi $t4, $t4, 4        # Move to next element
    addi $t5, $t5, 4
    addi $t2, $t2, 1        # Increment index counter

    blt $t2, 5, swap_loop    # Loop through inner loop if index > 0

    beqz $t3, loop    # Repeat outer loop if swaps occurred
    
print_array:
	li $v0, 4               # Print newline syscall
    	la $a0, newline
	syscall

	la $t0, array           # Reset address of the array
 	li $t2, 0                # Reset index counter

print_loop:
	lw $a0, 0($t0)          # Load array element
	li $v0, 1               # Print integer syscall
	syscall

	li $v0, 4               # Print space syscall
	la $a0, space
	syscall

	addi $t0, $t0, 4        # Move to next element
	addi $t2, $t2, 1        # Increment index counter

	blt $t2, 6, print_loop  # Loop through print loop if index < size

	li $v0, 10              # Exit syscall
	syscall