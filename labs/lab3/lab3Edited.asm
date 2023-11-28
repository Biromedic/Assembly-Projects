.data
arr: .word 120, 5, 9, 22, 15, 8, 10, 18, 30
n:   .word 9
firstMax: .word 0
secondMax: .word 0
newline: .asciiz "\n"
format: .asciiz "The second largest element: %d\n"

.text
.globl main

main:
    # Initialize registers
    la $a0, arr         # Load the address of arr into $a0
    lw $a1, n           # Load the value of n into $a1

    lw $t0, 0($a0)      # Load the first element of arr into $t0
    lw $t1, 4($a0)      # Load the second element of arr into $t1

    
    bgt $t0, $t1, initialize_firstMax
    initialize_secondMax:
        move $t0, $t1  
        li $t1, -1  
        j start_loop

    initialize_firstMax:
        li $t1, -1 
        j start_loop

    start_loop:
        li $t2, 2          
        loop:
            beq $t2, $a1, done  

            lw $t3, 4($a0)      # Load arr[i] into $t3
            bgt $t3, $t0, update_first_max  # if arr[i] > firstMax, update firstMax
            bgt $t3, $t1, update_second_max  # if arr[i] > secondMax, update secondMax

            j increment_counter

        update_first_max:
            move $t1, $t0   
            move $t0, $t3  
            j increment_counter

        update_second_max:
            move $t1, $t3    # Update secondMax with the new value
            j increment_counter

        increment_counter:
            addi $t2, $t2, 1  # Increment the loop counter
            addi $a0, $a0, 4  # Move to the next element in arr
            j loop

    done:
        move $a0, $t1        # Load secondMax into $a0
        li $v0, 1            # Set syscall code for print integer
        syscall

        # Print a newline
        li $v0, 4            # Set syscall code for print string
        la $a0, newline      # Load the address of newline into $a0
        syscall

        # Exit the program
        li $v0, 10           # Set syscall code for program exit
        syscall
