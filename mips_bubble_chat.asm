    .data
array:  .word 9, 4, 2, 3, 7, 6, 8, 1, 2
size:   .word 9
newline: .asciiz "\n"
space:   .asciiz " "

    .text
    .globl main

main:
    lw $t0, size           # Load size of array
    li $t1, 1              # Flag to indicate if swaps occurred
    la $t2, array          # Load address of the array
    addi $t3, $t2, 4       # Point to next element
    addi $t4, $zero, 0     # Initialize index counter

outer_loop:
    sub $t0, $t0, 1        # Decrement size counter
    beq $t0, $zero, print_and_exit    # If size is 0, exit loop
    
    li $t1, 0              # Reset swap flag

    la $t2, array          # Reset address of the array
    addi $t3, $t2, 4       # Reset pointer to next element
    addi $t4, $zero, 0     # Reset index counter

inner_loop:
    lw $t5, 0($t2)         # Load array[i]
    lw $t6, 0($t3)         # Load array[i+1]
    ble $t5, $t6, no_swap  # If array[i] <= array[i+1], no swap needed

    sw $t6, 0($t2)         # Swap array[i] and array[i+1]
    sw $t5, 0($t3)

    li $t1, 1              # Set swap flag

no_swap:
    addi $t2, $t2, 4       # Move to next element
    addi $t3, $t3, 4
    addi $t4, $t4, 1       # Increment index counter

    blt $t4, $t0, inner_loop  # Loop through inner loop if index < size

    bne $t1, $zero, outer_loop  # Repeat outer loop if swaps occurred

print_and_exit:
    li $t0, 9               # Reset size counter
    la $t2, array           # Reset address of the array
    addi $t3, $t2, 4        # Reset pointer to next element
    addi $t4, $zero, 0      # Reset index counter

print_loop:
    lw $a0, 0($t2)          # Load array element
    li $v0, 1               # Print integer syscall
    syscall

    li $v0, 4               # Print space syscall
    la $a0, space
    syscall

    addi $t2, $t2, 4        # Move to next element
    addi $t4, $t4, 1        # Increment index counter

    blt $t4, 9, print_loop  # Loop through print loop if index < size

    li $v0, 4               # Print newline syscall
    la $a0, newline
    syscall

    li $v0, 10              # Exit syscall
    syscall
