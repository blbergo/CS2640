# CS2640, date: 10/16/23
# Bryan Bergo
# practice more branching
# if(i == j)
# i +++
# j --

.data
msgi : .asciiz "Please enter the value of i: "
msgj : .asciiz "Please enter the value of j: "
resi: .asciiz "New value of i:"
resj: .asciiz "New value of j:"

.text
main:
    # print the message prompting the value of i
    li $v0, 4
    la $a0, msgi
    syscall

    # read the value of i
    li $v0, 5
    syscall
    move $s1, $v0

    # print the message prompting the value of j
    li $v0, 4
    la $a0, msgj
    syscall

    # read the value of j
    li $v0, 5
    syscall
    move $s2, $v0

    bne $s1, $s2, L1 # if j != i
        addi $s1, $s1, 1 # i++

        # display the result message for i
        li $v0, 4
        la $a0, resi
        syscall

        # display the new value of i
        li $v0, 1
        move $a0, $s1
        syscall

    L1:
        addi $s2, $s2, -1 # j--

        # display the result message for j
        li $v0, 4
        la $a0, resj
        syscall

        # display j
        li $v0, 1
        move $a0, $s2
        syscall
exit:
    li $v0, 10
    syscall
    