# Please write your name and ID here
# Name: Jackson Myers
# Student ID: 56528546

# All memory structures are placed after the
# .data assembler directive
.data
input:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 # change these values (and size) to test your program
output:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # This will store the count for each number (The size of this output must be the same to input's size)

# Declare main as a global function
.globl main 

# All program code is placed after the
# .text assembler directive
.text 		

# The label 'main' represents the starting point
main:
	la $a0, input	# $a0 based address of input array
	li $a1, 12	# $a1 how many numbers are in the array

	jal countNumbers

	#Write your code here

	
	#Print result 
	jal printResult





# countNumbers function starts here
countNumbers :
	#Write your code here	
	
	#You must use the jal instruction for function call
	jal increaseCnt	


	#You must use the jr instruction for return 
	jr $ra

# increaseCnt function starts here
increaseCnt:
	#Write your code here	

	#You must use the jr instruction for return 
	jr $ra

# printResult function starts here
printResult:
	#Write your code here	

	#You must use the jr instruction for return 
	jr $ra
