.data
div_zero_label: .asciiz "Error division by zero
"
string_label_0:	.asciiz "factorial number 5,7,9:\n"
string_label_1:	.asciiz "\n"
string_label_2:	.asciiz "\n"
string_label_3:	.asciiz "\n"
string_label_4:	.asciiz "fibo number 5,6,9:\n"
string_label_5:	.asciiz "\n"
string_label_6:	.asciiz "\n"
.text
__print:
li	$v0, 4
syscall
jr	$ra
.end __print
__printi:
lw $a0, 0($sp)
li	$v0, 1
syscall
jr	$ra
.end __printi
__factorial:
lw	$8, 0($fp)
li	$9, 1
beq, $8, $9, label_21
j label_16
label_16:
lw	$10, 0($fp)
li	$11, 0
beq, $10, $11, label_21
j label_29
label_21:
li	$12, 1
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_26
addu	$sp, $sp, 4
label_26:
move $v0, $12
jr	$ra
label_29:
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
lw	$8, 0($fp)
li	$9, 1
subu	$8, $8, $9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __factorial
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
move	$13, $v0
lw	$14, 0($fp)
mulou	$13, $13, $14
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_88
addu	$sp, $sp, 4
label_88:
move $v0, $13
jr	$ra
label_91:
subu $sp, $fp, 0 # fix sp
.end __factorial
__fibo:
lw	$14, 0($fp)
li	$15, 1
beq, $14, $15, label_104
j label_99
label_99:
lw	$16, 0($fp)
li	$17, 0
beq, $16, $17, label_104
j label_112
label_104:
li	$18, 1
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_109
addu	$sp, $sp, 4
label_109:
move $v0, $18
jr	$ra
label_112:
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
lw	$8, 0($fp)
li	$9, 1
subu	$8, $8, $9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fibo
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
move	$19, $v0
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
lw	$8, 0($fp)
li	$9, 2
subu	$8, $8, $9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fibo
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
move	$20, $v0
addu	$19, $19, $20
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_275
addu	$sp, $sp, 4
label_275:
move $v0, $19
jr	$ra
label_278:
subu $sp, $fp, 0 # fix sp
.end __fibo
.globl main
main:
move $fp, $sp
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_0
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
# Function Call #
#Push all regs : begining.
#**************************


#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
li	$8, 5
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __factorial
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$9, $v0
sw	$9, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printi
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_1
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
# Function Call #
#Push all regs : begining.
#**************************


#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
li	$8, 7
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __factorial
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$9, $v0
sw	$9, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printi
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_2
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
# Function Call #
#Push all regs : begining.
#**************************


#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
li	$8, 9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __factorial
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$9, $v0
sw	$9, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printi
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_3
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
# Function Call #
#Push all regs : begining.
#**************************


#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
li	$8, 4
li	$9, 1
addu	$8, $8, $9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fibo
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$9, $v0
sw	$9, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printi
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_5
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
# Function Call #
#Push all regs : begining.
#**************************


#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
li	$8, 2
li	$9, 4
mulou	$8, $8, $9
li	$9, 2
subu	$8, $8, $9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fibo
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$9, $v0
sw	$9, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printi
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_6
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)
subu $sp, $sp ,4
sw	$11, ($sp)
subu $sp, $sp ,4
sw	$12, ($sp)
subu $sp, $sp ,4
sw	$13, ($sp)
subu $sp, $sp ,4
sw	$14, ($sp)
subu $sp, $sp ,4
sw	$15, ($sp)
subu $sp, $sp ,4
sw	$16, ($sp)
subu $sp, $sp ,4
sw	$17, ($sp)
subu $sp, $sp ,4
sw	$18, ($sp)
subu $sp, $sp ,4
sw	$19, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
# Function Call #
#Push all regs : begining.
#**************************


#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
li	$8, 9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fibo
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$9, $v0
sw	$9, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printi
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$19, ($sp)
addu	$sp, $sp, 4
lw	$18, ($sp)
addu	$sp, $sp, 4
lw	$17, ($sp)
addu	$sp, $sp, 4
lw	$16, ($sp)
addu	$sp, $sp, 4
lw	$15, ($sp)
addu	$sp, $sp, 4
lw	$14, ($sp)
addu	$sp, $sp, 4
lw	$13, ($sp)
addu	$sp, $sp, 4
lw	$12, ($sp)
addu	$sp, $sp, 4
lw	$11, ($sp)
addu	$sp, $sp, 4
lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
label_1463:
li  $v0,  10 # call to end prog
syscall
.end main
subu $sp, $fp, 0 # fix sp
