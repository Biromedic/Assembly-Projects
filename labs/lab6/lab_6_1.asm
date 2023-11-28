.data
    result: .word 1
    n: .word 8   
.text
.globl main

main:
    la $t7, result
    la $a1, n

    jal doubleFactorial
    
    addi $t1, $v0,0
    add $a0, $t1, $zero 
    li $v0, 1         
    syscall        
     
    j exit2    

doubleFactorial:
    lw $t0, 0($a1)      # Load n $t0
    li $t1, 1           

    loop:
        blez $t0, exit   #  n <= 0 exit
        mul $t1, $t1, $t0 # n * result
        subi $t0, $t0, 2  # Decrement
        j loop

    exit:
        sw $t1, 0($t7)    # Store the result in memory
        addi $v0, $t1, 0
        jr $ra            # Return

exit2:
    li $v0, 10      
    syscall  
	