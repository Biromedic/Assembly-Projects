.data
arr:    .word 12, 5, 9, 14, 15, 8, 10, 41
n:      .word 9
secondMax: .word 0
firstMax: .word 0
second_largest_msg: .asciiz "The second largest element:  "
.text
.globl main
main: 
	
    	la $t0, arr # Load the address of the array into a register
    	lw $t1, n   #     int n = 9;
    	lw $t3, 0($t0)    # int firstMax = arr[0];
   	move $t4, $t3     # int SecondMax = arr[0];
   	
   	loop:
   	addi $t0, $t0, 4  
   	subi $t1, $t1, 1
   	
   	beq $t1, $0, out_of_loop
    	lw $t5, 0($t0) # Load the current element into $t5
   	
        # Compare 
    	bgt $t5, $t3, update_first_max

    	bge $t5, $t4, continue_loop
    	j continue_loop

	update_first_max:
    		move $t4, $t5 # Update secondMax with the current value of firstMax
    		move $t3, $t5  #Update firstMax with the current element
    	    	
	continue_loop:
		j loop
	
out_of_loop:
    li $v0, 4
    la $a0, second_largest_msg
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

