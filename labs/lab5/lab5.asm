.data
arr1:   .word  5, -1, 4, -6, 0, 8, -3, 7
arr2:   .word

.text
.globl main
.globl test

main:
    la $s0, arr1   # $s0 = &arr1[0]
    la $s1, arr2   # $s1 = &arr2[0]

loop:
     beq  $t7, 8, exit
     lw $a0, 0($s0)  # Load arr1[i] into $a0

    jal test
	
    # Store the result in arr2[i]
    beq $v0, 0, jump
    
    sw $a0, 0($s1)
    addi $s1, $s1, 4
    
    jump:
    addi $s0, $s0, 4    
    add, $t7,$t7,1 #counter
    j loop 
    
    exit:
    	addi $v0, $zero, 10 
    	syscall
test:

    # Check the MSB of the input value
    srl $t1, $a0, 31  
    xor $v0, $t1, 1
    jr $ra