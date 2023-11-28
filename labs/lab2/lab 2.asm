.data
array:  .word 3, 7, 4, 5, 6, 8, 2, 9, 1   # 9-element integer array

.text
.globl main

main:
    # Initialize loop variables
    li $t0, 0       # $t0 = loop index
    la $t1, array   # $t1 = address of the array
    li $t2, 1       # Initialize the product to 1

loop:
    lw $t3, ($t1)  # Load element in $t3
    mul $t2, $t2, $t3  # Multiply current element
    addi $t0, $t0, 1   # loop index +1
    addi $t1, $t1, 4   #next element 
    bne $t0, 9, loop   # branch if not equal for 9

    li $v0, 1
    move $a0, $t2
    syscall


