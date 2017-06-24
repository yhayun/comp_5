.data
div_zero_label: .asciiz "Error division by zero
"
string_label_0:	.asciiz "\n"
string_label_1:	.asciiz "\n"
string_label_2:	.asciiz "\n"
string_label_3:	.asciiz "\n"
string_label_4:	.asciiz "\nEnd\n"
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
__f:
li $9, 1
beq $8, $9, label_15
j label_39
label_15:
lw	$8, 0($fp)
lw	$9, 4($fp)
mulu	$8, $8, $9
lw	$9, 8($fp)
mulu	$8, $8, $9
lw	$9, 12($fp)
addu	$8, $8, $9
lw	$9, 16($fp)
mulu	$8, $8, $9
lw	$9, 20($fp)
mulu	$8, $8, $9
lw	$9, 24($fp)
addu	$8, $8, $9
lw	$9, 4($fp)
mulu	$8, $8, $9
lw	$9, 12($fp)
mulu	$8, $8, $9
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_36
addu	$sp, $sp, 4
label_36:
move $v0, $8
jr	$ra
label_39:
lw	$9, 0($fp)
lw	$10, 4($fp)
addu	$9, $9, $10
lw	$10, 8($fp)
addu	$9, $9, $10
lw	$10, 12($fp)
mulu	, , $10
lw	$10, 16($fp)
lw	$11, 20($fp)
addu	$10, $10, $11
lw	$11, 24($fp)
addu	$10, $10, $11
addu	, , 
li	$11, 2
mulu	, , $11
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_58
addu	$sp, $sp, 4
label_58:
move $v0, 
jr	$ra
subu $sp, $fp, 0 # fix sp
.end __f
__g:
lw	$11, 0($fp)
lw	$12, 4($fp)
addu	$11, $11, $12
li	$12, 1
addu	$11, $11, $12
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_72
addu	$sp, $sp, 4
label_72:
move $v0, $11
jr	$ra
subu $sp, $fp, 0 # fix sp
.end __g
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
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
li	$10, 3
sw	$10, ($sp)
addu $sp, $sp ,4
li	$11, 4
sw	$11, ($sp)
addu $sp, $sp ,4
li	$12, 5
sw	$12, ($sp)
addu $sp, $sp ,4
li	$13, 6
sw	$13, ($sp)
addu $sp, $sp ,4
li	$14, 10
sw	$14, ($sp)
addu $sp, $sp ,4
j label_146
label_141:
addu	$sp, $sp, 4
li	$15, 1
sw	$15, ($sp)
j label_150
label_146:
addu	$sp, $sp, 4
li	$15, 0
sw	$15, ($sp)
label_150:
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
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
move	$15, $v0
sw	$15, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_0
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
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
subu	$sp, $sp, 4
li	$8, 0
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 0
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
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
move	$10, $v0
sw	$10, ($sp)
addu $sp, $sp ,4
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 0
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
move	$11, $v0
sw	$11, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 1
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$12, $v0
sw	$12, ($sp)
addu $sp, $sp ,4
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
subu	$sp, $sp, 4
li	$8, 2
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 1
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
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
sw	$13, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 2
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$14, $v0
sw	$14, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 3
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$15, $v0
sw	$15, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 8
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 1
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$16, $v0
sw	$16, ($sp)
addu $sp, $sp ,4
j label_743
label_738:
addu	$sp, $sp, 4
li	$17, 1
sw	$17, ($sp)
j label_747
label_743:
addu	$sp, $sp, 4
li	$17, 0
sw	$17, ($sp)
label_747:
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
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
move	$17, $v0
sw	$17, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_1
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
li	$10, 3
sw	$10, ($sp)
addu $sp, $sp ,4
li	$11, 4
sw	$11, ($sp)
addu $sp, $sp ,4
li	$12, 5
sw	$12, ($sp)
addu $sp, $sp ,4
li	$13, 6
sw	$13, ($sp)
addu $sp, $sp ,4
li	$14, 10
sw	$14, ($sp)
addu $sp, $sp ,4
j label_957
label_957:
addu	$sp, $sp, 4
li	$15, 1
sw	$15, ($sp)
j label_966
label_962:
addu	$sp, $sp, 4
li	$15, 0
sw	$15, ($sp)
label_966:
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
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
move	$15, $v0
sw	$15, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_2
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
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
subu	$sp, $sp, 4
li	$8, 0
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 0
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
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
move	$10, $v0
sw	$10, ($sp)
addu $sp, $sp ,4
# Function Call #
#Push all regs : begining.
#**************************

subu $sp, $sp ,4
sw	$8, ($sp)
subu $sp, $sp ,4
sw	$9, ($sp)
subu $sp, $sp ,4
sw	$10, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 0
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$10, ($sp)
addu	$sp, $sp, 4
lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
move	$11, $v0
sw	$11, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 1
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$12, $v0
sw	$12, ($sp)
addu $sp, $sp ,4
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
subu	$sp, $sp, 4
li	$8, 2
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 1
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
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
sw	$13, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 2
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$14, $v0
sw	$14, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 3
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$15, $v0
sw	$15, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 8
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 1
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$16, $v0
sw	$16, ($sp)
addu $sp, $sp ,4
j label_1578
label_1578:
addu	$sp, $sp, 4
li	$17, 1
sw	$17, ($sp)
j label_1587
label_1583:
addu	$sp, $sp, 4
li	$17, 0
sw	$17, ($sp)
label_1587:
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
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
move	$17, $v0
sw	$17, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_3
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
li	$10, 3
sw	$10, ($sp)
addu $sp, $sp ,4
li	$11, 4
sw	$11, ($sp)
addu $sp, $sp ,4
li	$12, 5
sw	$12, ($sp)
addu $sp, $sp ,4
li	$13, 6
sw	$13, ($sp)
addu $sp, $sp ,4
li	$14, 10
sw	$14, ($sp)
addu $sp, $sp ,4
j label_1814
label_1814:
addu	$sp, $sp, 4
li	$15, 1
sw	$15, ($sp)
j label_1823
label_1819:
addu	$sp, $sp, 4
li	$15, 0
sw	$15, ($sp)
label_1823:
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
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
move	$15, $v0
sw	$15, ($sp)
addu $sp, $sp ,4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
li	$8, 1
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 2
sw	$9, ($sp)
addu $sp, $sp ,4
li	$10, 3
sw	$10, ($sp)
addu $sp, $sp ,4
li	$11, 4
sw	$11, ($sp)
addu $sp, $sp ,4
li	$12, 5
sw	$12, ($sp)
addu $sp, $sp ,4
li	$13, 6
sw	$13, ($sp)
addu $sp, $sp ,4
li	$14, 10
sw	$14, ($sp)
addu $sp, $sp ,4
j label_1920
label_1915:
addu	$sp, $sp, 4
li	$15, 1
sw	$15, ($sp)
j label_1924
label_1920:
addu	$sp, $sp, 4
li	$15, 0
sw	$15, ($sp)
label_1924:
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
move	$16, $v0
sw	$16, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __g
addu	$sp, $sp, 4
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
move	$17, $v0
sw	$17, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
la	$a0, string_label_4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __print
addu	$sp, $sp, 4
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

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
# here we can make sure we CLEAR the stack
move	$fp, $sp
jr	$ra
subu $sp, $fp, 0 # fix sp
li  $v0,  10 # call to end prog
syscall
.end main
subu $sp, $fp, 0 # fix sp
