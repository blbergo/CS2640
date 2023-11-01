# CS2640, date: 10/16/23
# Bryan Bergo
# This code will practice if-then-else statements

# Assume f, g,h,i and j in $s0, $s1, $s2, $s3, and $s4, respectively.
# if(i ==j) 
#    f = g + h;
# else
#    f = g-h;
.data
msgi : .asciiz "Please enter the value of i: "
msgj : .asciiz "Please enter the value of j: "
msgf : .asciiz "Please enter the value of f: "
msgg : .asciiz "Please enter the value of g: "
msgh : .asciiz "Please enter the value of h: "
display_f_equal: .asciiz "f = g + h: "
display_f_not_equal: .asciiz "f = g - h: "

.text
main:
   # read f, g, h, i, j
    # display the message to read f (syscall 4 = print string)
    li $v0, 4
    la $a0, msgf
    syscall 

    # read f (syscall 5 = read int)
    li $v0, 5
    syscall
    move $s0, $v0

    # display the message to read g (syscall 4 = print string)
    li $v0, 4
    la $a0, msgg
    syscall

    # read g (syscall 5 = read int)
    li $v0, 5
    syscall
    move $s1, $v0

    # display the message to read h (syscall 4 = print string)
    li $v0, 4
    la $a0, msgh
    syscall

    # read h (syscall 5 = read int)
    li $v0, 5
    syscall
    move $s2, $v0

    # display the message to read i (syscall 4 = print string)
    li $v0, 4
    la $a0, msgi
    syscall

    # read i (syscall 5 = read int)
    li $v0, 5
    syscall
    move $s3, $v0

    # display the message to read j (syscall 4 = print string)
    li $v0, 4
    la $a0, msgj
    syscall

    # read j (syscall 5 = read int)
    li $v0, 5
    syscall
    move $s4, $v0
    
    bne $s3, $s4, not_equal # if i = j then go to equal
    not_equal:
    	sub $t0, $s1, $s2 # i != j, then go to else F = g - h
    	la $a0, display_f_not_equal
    	li $v0, 4 
    	syscall
    	
    	li $v0, 1
    	move $a0, $t0
    	syscall
    	
    	j exit # jump to exit
    
    equal: 
    	add $t0, $s1, $s2 # i == j is true
    	li $v0, 4
    	la $a0, display_f_equal
    	
    	li $v0, 1
    	move $a0, $t0
    	syscall
    	
    	syscall
    	j exit
   
exit:
	li $v0, 10
	syscall



    
