# Author: Bryan Bergo date: 10/18/23
# This code will be used to practice nested if-then else statements
#
# if k == 0, f = i + j
# else if k == 1, f = g + h
# else if k == 2, f = g - h
# else if k == 3, f = i - j
# else f = 0

.data
msgf : .asciiz "Please enter the value of f: "
msgg : .asciiz "Please enter the value of g: "
msgh : .asciiz "Please enter the value of h: "
msgi : .asciiz "Please enter the value of i: "
msgj : .asciiz "Please enter the value of j: "
msgk : .asciiz "Please enter the value of k: "
display_k_equal_0: .asciiz "f = i + j: "
display_k_equal_1: .asciiz "f = g + h: "
display_k_equal_2: .asciiz "f = g - h: "
display_k_equal_3: .asciiz "f = i - j: "
dispaly_else: .asciiz "f = 0"

.text
main:
    ####################
    # Read in integers #
    ####################

    # print message to read f
    li $v0, 4
    la $a0, msgf
    syscall

    # read a value for f
    li $v0, 5
    syscall
    move $s0, $v0

    # print message to read g
    li $v0, 4
    la $a0, msgg
    syscall

    # read a value for g
    li $v0, 5
    syscall
    move $s1, $v0

    # print a message to read h
    li $v0, 4
    la $a0, msgh
    syscall

    # read a value for h
    li $v0, 5
    syscall
    move $s2, $v0

    # print a message to read i
    li $v0, 4
    la $a0, msgi
    syscall

    # read a value for i
    li $v0, 5
    syscall
    move $s3, $v0

    # print a message to read j
    li $v0, 4
    la $a0, msgj
    syscall

    # read a value for j
    li $v0, 5
    syscall
    move $s4, $v0

    # print a message to read k
    li $v0, 4
    la $a0, msgk
    syscall

    # read a value for k
    li $v0, 5
    syscall
    move $s5, $v0

    ###################
    #   Nested Loop   #
    ###################
    beq $s5, $0, k_equal_0
    beq $s5, 1, k_equal_1
    beq $s5, 2, k_equal_2
    beq $s5, 3, k_equal_3

    move $s0, $0 # f = 0
    
    # print out f
    li $v0, 1
    move $a0, $s0
    syscall

    j exit

    k_equal_0:
        add $s0, $3, $s4 # f = i + j

        # display the formula for f
        li $v0, 4
        la $a0, display_k_equal_0
        syscall

        # print out the value of f
        li $v0, 1
        move $a0, $s0
        syscall

        j exit

    k_equal_1:
        add $s0, $s1, $s2 # f = g + h
        # display the formula for f
        li $v0, 4
        la $a0, display_k_equal_1
        syscall

        # print out the value of f
        li $v0, 1
        move $a0, $s0
        syscall

        j exit
    
    k_equal_2:
        sub $s0, $s1, $s2
        # display the formula for f
        li $v0, 4
        la $a0, display_k_equal_2
        syscall

        # print out the value of f
        li $v0, 1
        move $a0, $s0
        syscall

        j exit
    
    k_equal_3:
        sub $s0, $s3, $s4

        # display the formula for f
        li $v0, 4
        la $a0, display_k_equal_3
        syscall

        # print out the value of f
        li $v0, 1
        move $a0, $s0
        syscall
        j exit
    

exit:
    li $v0, 10
    syscall
