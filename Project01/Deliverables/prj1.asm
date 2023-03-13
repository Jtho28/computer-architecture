# Please write your name and ID here
# Name: Jackson Myers
# Student ID: 56528546

# All memory structures are placed after the
# .data assembler directive
.data
input:		.word 1, 1, 1, 2, 0, 4# change these values (and size) to test your program
output:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # This will store the count for each number (The size of this output must be 50 regardless of input's size)
error:		.asciiz "Error: invalid number: "		#define error string
newline:	.asciiz "\n"
result:		.asciiz "Result:\n"
colon:		.asciiz " : "

# Declare main as a global function
.globl main 

# All program code is placed after the
# .text assembler directive
.text

# The label 'main' represents the starting point
main:
	la $a0, input	# $a0 based address of input array
	li $a1, 6	# $a1 how many numbers are in the array
	la $a2, output 	# load base address of output
	li $a3, 0	# num

	jal countNumbers

	#Write your code here

	
	#Print result 
	jal printResult
	
	li $v0, 10
	syscall
	
	
countNumbers:
	
	#define and initialize i
	addi $s0, $zero, 0
	
	subi $s1, $a1, 1
	
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
		bge $s0, $a1, end_loop
		sll $t0, $s0, 2
		add $t0, $t0, $a0
		
		lw $a3, 0($t0)
		
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
		
		
increaseCnt:
		
		addi $t0, $a3, 0
		
		blt $t0, 0, false_range
		bgt $t0, 49, false_range
		sll $t0, $t0, 2		#num * 4
		add $t1, $t0, $a2	#output[num]
		lw $t2, 0($t1)		#pull value at output[num] from address
		addi $t2, $t2, 1	#add 1 to value
		sw $t2, 0($t1)
		
		jr $ra
		
	false_range:
		li $v0, 4
		la $a0, error
		syscall
		
		li $v0, 1
		la $a0, ($t0)
		syscall
		
		li $v0, 10
		syscall			#exit
		
printResult:
	#li $v0, 1
	#move $a0, $a3
	#syscall
	
	addi $s2, $zero, 0
	
	li $v0, 4
	la $a0, result
	syscall
	
	loop2:
		bge $s2, 50, gomain
		sll $t0, $s2, 2		# i * 4
		add $t0, $t0, $a2	# output[i]
		lw $t1, 0($t0)
		
		addi $s2, $s2, 1	# i++
		addi $s3, $s2, -1	# i - 1
		
		beq $t1, $zero, loop2
		
		li $v0, 1
		la $a0, ($s3)
		syscall
		
		li $v0, 4
		la $a0, colon
		syscall
		
		li $v0, 1
		la $a0, ($t1)
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		j loop2
		
	gomain:
		jr $ra

