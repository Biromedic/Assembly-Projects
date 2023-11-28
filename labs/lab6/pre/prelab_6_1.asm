.data
	sum: .word 0
	a: .word 7
	b: .word 15
.text
.globl main 

main:
    la $a0, sum         
    la $a1, a             
    la $a2, b             

    jal addfunc           

    li $v0, 10            # System call code for exit
    syscall               # Make system call


addfunc:
	lw $t0, 0($a0) #sum
	lw $t1, 4($a0) #a 
	lw $t2, 8($a0) #b
	
	add $t4, $zero, $t1 #t4'e a'yý koyduk. 
	j loop

loop:
	bgt $t4, $t2, exit 
	add $t3, $t3, $t4       
	#add $t5, $t3, $zero 
	addi $t4, $t4, 1 
	j loop
	
exit:
	sw $t3, 0($a0)
	jr $ra
