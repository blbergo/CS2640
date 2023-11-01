# Bryan Bergo, date: 10/30/23
# Description: this code is a practice session of a nested_loop
# for (int i = 1; i <= 5; i++) {
#   System.out.println("Outer loop iteration " + 1)
#   for (int j = 1; j <= 2; j++) {
#       System.out.println("i = " + i + "; j = " + j);
#   }
# }

.data
msgi: .asciiz "\nOuter loop iteration is: "
msgj: .asciiz "\nInner loop iteration is: "

.text
main:
    	li $s0, 1 # $s0 = i = 1

    	loop_i: bgt $s0, 5, exit # if i >= 5
    		# print out the outer loop iteration
    		la $a0, msgi
    		li $v0, 4 # 4 is the code to print a string
    		syscall
    		
    		# print out i
    		move $a0, $s0
    		li $v0, 1 # 1 is the code to print an integer
    		syscall
    		
    		# initialize inner counter vars
    		li $s1, 1 # $s1 = j = 1
    
    		# increment outer counter:
    		addi $s0, $s0, 1
    		
    		# inner loop
    		loop_j: bgt, $s1, 2, loop_i
    			la $a0, msgj
    			li $v0, 4 # 4 is to print a string
    			syscall
    			
    			# print out j
    			move $a0, $s1
    			li $v0, 1 # 1 is the code to print an int
    			syscall
    			
    			# increment counter
    			addi $s1, $s1, 1
    			
    			j loop_j
    
    
exit:
	li $v0, 10 # 10 is the code for exit
	syscall
