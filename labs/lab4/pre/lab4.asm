.data
array: .word 7, -4, 5, -5, 8, -2, 1, -3 
size: .word 8
sum:    .word 0
.text
.globl main

main:
	lw $t1, size
	lw $t2, sum
	la $t3, array
	#t0 counter
	
	loop_i:  
		beq $t0, $t1, exit
		lw $t4, 0($t3)
		addi $t3, $t3, 4
		bltz $t4, next 
		add $t2, $t2 ,$t4
	next:
		addi $t0, $t0, 1
		
		j loop_i
    	exit:
    		li $v0, 10             # Exit program
    		syscall