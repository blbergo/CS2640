# Author: Bryan Bergo, date: 10/23/23
# Description: We will practice simple for loop
# The code will compute the sums of the values from 0 to n-1
# We get the value of n from the user
# 
# n = prompt('Enter the value to calculate the sum up to: ')
# total = 0
# for(i = 0; i < n; i++) {
#  total = total + i
# }
# print('Total = ' + total)

.data
input_msg: .asciiz "Enter the value to calculate the sum up to: "
output_msg: .asciiz "The sum of the values is: "

.text
main:
    ###################
    # Read the values #
    ###################

    # print input_msg
    li $v0, 4 # 4 is the code to print string
    la $a0, input_msg # load the address of the string
    syscall

    # read the input from the user
    li $v0, 5 # 5 is the code to read integer
    syscall
    move $s0, $v0 # save the value in $t0

    ###################
    # Compute the sum #
    ###################

    move $s1 $zero # initialize the sum to 0
    move $t0 $zero # initialize the counter to 0


    for_loop:  
        add $s1, $s1, $t0 # total = total + 1
        addi $t0, $t0, 1 # add one to the counter
        blt $t0, $s0, for_loop # if i <= n then run the loop
  

    end_loop:
        # print the value of the total
        # print the output message
        la $a0, output_msg
        li $v0, 4
        syscall

        # display the value of sum
        move $a0, $s1
        li $v0, 1
        syscall

        j exit # exit the program 


exit:
    li $v0, 10 # 10 is the code to exit
    syscall
