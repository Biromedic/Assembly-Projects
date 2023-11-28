.data
.text
.globl main

main:
    # Initialize variables
    li $v0, 0          # $v0 will be used for the return value
    li $a0, 0          # sum = 0
    li $a1, 3          # a = 7
    li $a2, 6          # b = 15

    # Call addfunc
    jal addfunc
    
    # Exit program
    li $v0, 10
    syscall

addfunc:
    addi $sp, $sp, -12  # Allocate space on the stack
    sw $ra, 0($sp)     # Save return address
    sw $a1, 4($sp)     # Save lower bound
    sw $a2, 8($sp)     # Save higher bound

    # Load parameters
    lw $t0, 4($sp)     # Load lower bound
    lw $t1, 8($sp)     # Load higher bound

    beq $t0, $t1, base_case

    addi $a1, $a1, 1    # Increment lower bound
    jal addfunc

    lw $t0, 4($sp)     # Reload lower bound
    add $v0, $t0, $v0  # Update sum

    j exit_func

base_case:
    add $v0, $0, $a1   # Set sum to lower bound

exit_func:
    lw $ra, 0($sp)     # Restore return address
    addi $sp, $sp, 12  # Deallocate space on the stack
    jr $ra
