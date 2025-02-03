# minimum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the minimum value
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	#.asciiz "Enter the next number:\n"
    string1: .asciiz "Enter number:\n"
    min: .asciiz "Minimum: "
    newline: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

    li $v0, 4 
    la $a0, string1
    syscall


    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4 
    la $a0, string1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4 
    la $a0, string1
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    ble $t1, $t0, new_min
    j next

new_min:
    move $t0, $t1

next:
    ble $t2, $t0, new_min2
    j print

new_min2:
    move $t0, $t2

print:
    li $v0, 4 
    la $a0, min
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation

    li $v0, 10
    syscall