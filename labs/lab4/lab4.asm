.data
arr:    .word 8, 1, 4, 5, 6, 3, 2, 9, 7, 0
n:      .word 9
temp:   .word 0
i:      .word 0
j:      .word 0
.text
.globl main
main:
    lw      $t0, n
    la      $t1, arr
    la      $t2, temp
    la      $t3, i
    la      $t4, j

outer_loop:
    li      $t3, 0             # i = 0
inner_loop:
    lw      $t5, ($t1)         # arr[i] into $t5
    lw      $t6, ($t4)         # arr[j] into $t6
    beq     $t4, $t0, loop_exit  # If j == n, exit inner loop

    # Compare
    sub     $t7, $t6, $t5      # $t7 = arr[j] - arr[i]
    slt     $t9, $zero, $t7    # Set $t9 to 1 if $t7 < 0, else set to 0
    beq     $t9, $zero, no_swap  # Branch if $t7 >= 0

    # Swap
    sw      $t6, ($t1)         # Store arr[j] in arr[i]
    sw      $t5, ($t4)         # Store arr[i] in arr[j]

no_swap:
    addi    $t3, $t3, 4        # Increment i by 1
    addi    $t4, $t4, 4        # Increment j by 1
    j       inner_loop

loop_exit:
    addi    $t1, $t1, 4        # Increment the base address of arr
    li      $t3, 0             #  i  0
    addi    $t0, $t0, -1       # Decrement n
    bnez    $t0, outer_loop    # If n != 0, repeat outer loop

    # Exit
    li      $v0, 10
    syscall
