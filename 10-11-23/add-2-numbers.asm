# CS2640 date:10/11/23
# My second MIPS code
# The code will read two integers from the user and add them, then display the result
# The purpose of the code is to practice the syscall 5
.data
	msg1: .asciiz "Please enter your first integer: "
	msg2: .asciiz "Please enter your second integer: "
	msg3: .asciiz "The result: "

.text
main:
    # print the message to read the first integer
    la $a0, msg1
    li $v0, 4 # 4 = print string
    syscall
    
    # read the first integer
    li $v0, 5 # syscall code 5 is to read an integer
    syscall
    move $t0, $v0
    
    # print the message to read the first integer
    la $a0, msg2
    li $v0, 4
    syscall

    # read the second integer
    li $v0, 5
    syscall
    move $t1, $v0

    add $t2, $t0, $t1
    
    # print the result
    la $a0, msg3
    li $v0, 4
    syscall
    
    move $a0, $t2
    li $v0, 1
    syscall

    # exit the program
    li $v0, 10
    syscall
