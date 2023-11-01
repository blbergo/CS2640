# Author: Bryan Bergo date: 10-18-23
# This code tests my knowledge of branching
#
# if (a < b + 3), a = a + 1
# b = b + a
# $s0 = a, $s1 = b

.data
msga : .asciiz "Please enter the value of a: "
msgb : .asciiz "Please enter the value of b: "
display_a: .asciiz "\nValue of a: "
display_b: .asciiz "\nValue of b: "

.text
main:
	###################
	# Read User Input #
	###################
	
	# display message to input a
	li $v0, 4 # 4 is the code for printing a string
	la $a0, msga
	syscall
	
	# read the user inputted value for a
	li $v0, 5 # 5 is the code for reading an integer
	syscall
	move $s0, $v0
	
	# display message to input b
	li $v0, 4 # 4 is the code for printing a string
	la $a0, msgb
	syscall
	
	# read the user inputted value for b
	li $v0, 5 # 5 is the code for reading an integer
	syscall
	move $s1, $v0
	
	#############
	# Branching #
	#############
	
	# prepare conditional
	addi $t0, $s1, 3 # c = b + 3
	
	blt $s0, $t0, less_than # if a < c (b + 3)	
	j continue

less_than:
	addi $s0, $s0, 1 # a = a + 1
	j continue

continue:
	add $s1, $s1, $s0 # b = b + a
	
	################
	# Final Output #
	################
	
	# display the message for a
	li $v0, 4
	la $a0, display_a
	syscall
	
	# display the value of a
	li $v0, 1 # 1 is the code for printing an integer
	move $a0, $s0
	syscall
		
	# display the message for b
	li $v0, 4
	la $a0, display_b
	syscall
	
	# display the value of b
	li $v0, 1 # 1 is the code for printing an integer
	move $a0, $s1
	syscall
	
	j exit			
exit:
	li $v0, 10 # 10 is the code for exiting a program
	syscall
