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
# starting While loop
label_13:
lw	$8, 0($fp)
li	$9, 0
bne, $8, $9, label_18
j label_44
label_18:
lw	$10, 0($fp)
label_20:
li	$11, 5
bne	$11, ,$10, label_26
#break statement
j 
j label_37
label_26:
li	$11, 8
bne	$11, ,$10, label_37
li	$12, 0
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_33
addu	$sp, $sp, 4
label_33:
move $v0, $12
jr	$ra
j label_37
label_37:
lw	$10, 0($fp)
li	$11, 1
subu	$10, $10, $11
sw	$10, 0($fp)
subu $sp, $fp, 0 # fix sp
j label_13
label_44:
subu $sp, $fp, 0 # fix sp
# End While Loop
li	$11, 1
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_51
addu	$sp, $sp, 4
label_51:
move $v0, $11
jr	$ra
subu $sp, $fp, 0 # fix sp
.end __f
__printNum:
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
sw	$8, ($sp)
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
.end __printNum
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
li	$8, 6
sw	$8, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
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
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printNum
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
sw	$8, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
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
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printNum
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
sw	$8, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
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
sw	$9, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __printNum
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
# here we can make sure we CLEAR the stack
move	$fp, $sp
jr	$ra
subu $sp, $fp, 0 # fix sp
li  $v0,  10 # call to end prog
syscall
.end main
subu $sp, $fp, 0 # fix sp
