# factorial.asm program
# CS 64, Z.Matni
#
# Assembly (NON-RECURSIVE) version of:
#   unsigned int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++)
#       fn = fn * x;
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";

#Data Area (i.e. memory setup directive)
.data
	string1:	.asciiz	"Enter a number:\n"
	factorial: .asciiz "Factorial of "
	is: .asciiz " is:\n"
	newline: .asciiz "\n"
	# TODO: Write the rest of the initializations here

#Text Area (i.e. instructions/code directive)
.text
main:
	# TODO: Write your code here

	li $v0, 4
	la $a0, string1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0		# $t0 is n

	li $t1, 2			# $t1 is x, starts at 2
	li $t2, 1			# $t2 is fn

loop:
	bgt $t1, $t0, print
	mult $t2, $t1
	mflo $t2
	addi $t1, $t1, 1
	j loop

print:
	li $v0, 4
	la $a0, factorial
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, is
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 4
	la $a0, newline
	syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall