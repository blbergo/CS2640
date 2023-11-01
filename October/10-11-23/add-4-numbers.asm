.data
    msg1: .asciiz "Please enter your first integer: "
    msg2: .asciiz "Please enter your second integer: "
    msg3: .asciiz "Please enter your third integer: "
    msg4: .asciiz "Please enter your fourth integer: "

    res1: .asciiz "Result of f + g: "
    res2: .asciiz "\nResult of d + i: "
    res3: .asciiz "\nResult of a + b: "
    

.text
main:
    # print out the message
    la $a0, msg1
    li $v0, 4,
    syscall

    # get the first inputted number
    li $v0, 5
    syscall
    move $t0, $v0

    # print the second message
    la $a0, msg2
    li $v0, 4
    syscall

    # get the second number
    li $v0, 5
    syscall
    move $t1, $v0

    # print out the third message
    la $a0, msg3
    li $v0, 4
    syscall

    # read the third number
    li $v0, 5
    syscall
    move $t2, $v0

    # print out the fourth message
    la $a0, msg4
    li $v0, 4
    syscall

    # read the fourth number
    li $v0, 5
    syscall
    move $t3, $v0
    
    # print out the message
    la $a0, res1
    li $v0, 4,
    syscall

    # a = f + g (1st + 2nd)
    add $t4, $t0, $t1
    move $a0, $t4
    li $v0, 1
    syscall
    
    # print out the message
    la $a0, res2
    li $v0, 4,
    syscall

    # b = d + i (2nd + 3rd)
    add $t5, $t1, $t2
    move $a0, $t5
    li $v0, 1 # print integer
    syscall
    
    # print out the message
    la $a0, res3
    li $v0, 4,
    syscall

    # c = a + b
    add $t6, $t4, $t5
    move $a0, $t5
    li $v0, 1
    syscall

    li $v0, 10
    syscall
    
    



    
