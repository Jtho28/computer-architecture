# Please write your name and ID here
# Name: Jackson Myers
# Student ID: 56528546

# All memory structures are placed after the
# .data assembler directive
.data
input:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 # change these values (and size) to test your program
output:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # This will store the count for each number (The size of this output must be 50 regardless of input's size)
error:		.asciiz "Error: invalid number"		#define error string	

# Declare main as a global function
.globl main 

# All program code is placed after the
# .text assembler directive
.text 		

# The label 'main' represents the starting point
main:
	la $a0, input	# $a0 based address of input array
	li $a1, 12	# $a1 how many numbers are in the array
	la $a3, output	# base address of output array

	jal countNumbers

	#Write your code here

	
	#Print result 
	jal printResult





# countNumbers function starts here
countNumbers :
	#Write your code here
	
	#define and initialize i
	addi $s0, $zero, 0
	
	#store count - 1
	subi $s1, $a1, 1
	
	#set return value to 1 initially
	addi $v0, $zero, 1
	
	#create stack and store return address, count, i, count-1, and return value
	addi $sp, $sp, -20
	sw $ra, 0($sp) #store ra
	sw $a1, 4($sp) #store count
	sw $s0, 8($sp) #store i
	sw $s1, 12($sp) #store score-1
	sw $v0, 16($sp) #store return value
	
	#loop structure
	loop:
		bgt $s0, 12, end_loop
		sll $t0, $s0, 2 #multiply i by 4 and store in temp reg
		add $t0, $t0, $a0 #add i to base address for input array
		
		sw $a2,  0($t0) #store value of input[i] into the the parameter register as num
		
		
		
		#You must use the jal instruction for function call
		jal increaseCnt	
		
			
		
		addi $s0, $s0, 1
		
		j loop
	
	end_loop:
	
		lw $ra, 0($sp)
		lw $a1, 4($sp)
		lw $s0, 8($sp)
		lw $s1, 12($sp)
		lw $v0, 16($sp)
		addi $sp, $sp, 20
		
		
		li $v0, 1
		jr $ra	
	
	


	#You must use the jr instruction for return 
	jr $ra

# increaseCnt function starts here
increaseCnt:
	#Write your code here	
	blt $a2, $zero, false_range
	bgt $a2, 49, false_range
	sll $t0, $a2, 2		# num * 4 for offset
	add $s2, $a3, $t0	# output[num]
	lw $t2, 0($s2)		# load value at output[num] address
	addi $t2, $t2, 1
	sw $t2, 0($s2)
	
	li $v0, 1
	jr $ra
	
	
	false_range:
		li $v0, 0
		jr $ra

# printResult function starts here
printResult:
	#Write your code here	

	#You must use the jr instruction for return 
	jr $ra
