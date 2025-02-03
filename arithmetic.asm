# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( 4*b – a) + 5*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
    li $v0, 5
    syscall
    move $t0, $v0
    li $v0, 5
    syscall
    move $t1, $v0
    li $v0, 5
    syscall
    move $t2, $v0

    sll $t1, $t1, 2
    sub $t1, $t1, $t0
    # $t1 stores 4b - a

    sll $t1, $t1, 6

    li $t4, 5
    mult $t2, $t4
    mflo $t2
    #t2 stores 5c

    add $a0, $t1, $t2

    li $v0, 1
    syscall

exit:
	# Exit SPIM: Write your code here!
    li $v0, 10
    syscall