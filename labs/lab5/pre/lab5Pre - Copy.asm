.data
arr1:   .word   5, -1, 4, -3
arr2:   .space  16
newLine: .asciiz "\n"

.text
.globl main

main:
    la $s0, arr1   # $s0 = &arr1[0]
    la $s1, arr2   # $s1 = &arr2[0]

    # Loop to invert elements of arr1 and store them in arr2
invert:
    lw $t1, 0($s0)   # Load arr1[i] into $t1

    # Check if num != 0
    bnez $t1, notZero
    
    j nextIteration
notZero:
    # Calculate -num and store it in arr2[i]
    li $t3, 0        # Load zero into $t3
    sub $t2, $t3, $t1
    sw $t2, 0($s1)

nextIteration:
    # Increment loop counter and pointers
    addi $t0, $t0, 1
    addi $s0, $s0, 4
    addi $s1, $s1, 4

    # Check if the loop counter is less than 4
    blt $t0, 4, invert

    # Print arr2 elements
    li $v0, 4       # syscall code for print_string
    la $a0, newLine
    syscall

    li $t0, 0      # Reset the loop counter
    la $s1, arr2   # $s1 = &arr2[0]

printLoop:
    lw $t1, 0($s1)   # Load arr2[i] into $t1

    # Print arr2[i]
    li $v0, 1       # syscall code for print_integer
    move $a0, $t1   # Value to print
    syscall

    # Print a space
    li $v0, 4 
    la $a0, newLine
    syscall

    # Increment loop counter and pointer
    addi $t0, $t0, 1
    addi $s1, $s1, 4

    # Check if the loop counter is less than 4
    blt $t0, 4, printLoop

    # Exit
    li $v0, 10      
    syscall