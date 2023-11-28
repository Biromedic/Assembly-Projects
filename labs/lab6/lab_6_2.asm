.data
.text
.globl main

main:
    # Initialize variables
    li $v0, 1          # result = 1
    li $a1, 5          # n = 5 

    # Call doubleFactorial
    jal doubleFactorial
    
    # Exit program
    li $v0, 10
    syscall

doubleFactorial:

    blez $a1, base_case
    
    addi $sp, $sp, -8  # Allocate space on the stack
    sw $ra, 0($sp)     # Save return address
    sw $a1, 4($sp)     # Save lower bound
    
    addi $a1, $a1, -2
    	
    jal doubleFactorial
    
    lw $ra, 0($sp)     # Save return address
    lw $a1, 4($sp)     # Save lower bound
    mul $v0, $v0, $a1
    
    j exit_func

base_case:
    li $v0, 1           # Return 1 for the base case

exit_func:
    lw $ra, 0($sp)     # Restore return address
    addi $sp, $sp, 8   # Deallocate space on the stack
    jr $ra
