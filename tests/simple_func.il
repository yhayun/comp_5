.data
div_zero_label: .asciiz "Error division by zero
"
string_label_0:	.asciiz "\n"
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
lw	$8, 0($fp)
lw	$9, 4($fp)
addu	$8, $8, $9
lw	$9, 8($fp)
addu	$8, $8, $9
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_20
addu	$sp, $sp, 4
label_20:
move $v0, $8
jr	$ra
subu $sp, $fp, 0 # fix sp
.end __f
__g:
lw	$9, 0($fp)
lw	$10, 4($fp)
addu	$9, $9, $10
li	$10, 1
addu	$9, $9, $10
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_34
addu	$sp, $sp, 4
label_34:
move $v0, $9
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
li	$8, 3
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 4
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
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$13, $v0
sw	$13, ($sp)
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
li	$8, 4
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
li	$8, 4
sw	$8, ($sp)
addu $sp, $sp ,4
li	$9, 4
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
li	$8, 5
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
# getting the frame pointer back and return address!
lw	$ra, ($sp)
addu	$sp, $sp, 4
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************


#Pop all regs : end.
#**************************
move	$13, $v0
sw	$13, ($sp)
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
