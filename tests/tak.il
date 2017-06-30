.data
div_zero_label: .asciiz "Error division by zero
"
string_label_0:	.asciiz "\n"
string_label_1:	.asciiz "\n"
string_label_2:	.asciiz "\n"
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
__ex:
lw	$8, 4($fp)
lw	$9, 0($fp)
blt, $8, $9, label_16
j label_228
label_16:
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
lw	$8, 0($fp)
li	$9, 1
subu	$8, $8, $9
sw	$8, 0($sp)
lw	$9, 4($fp)
sw	$9, 4($sp)
lw	$10, 8($fp)
sw	$10, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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
move	$11, $v0
sw	$11, 0($sp)
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
subu	$sp, $sp, 4
lw	$8, 4($fp)
li	$9, 1
subu	$8, $8, $9
sw	$8, 0($sp)
lw	$9, 8($fp)
sw	$9, 4($sp)
lw	$10, 0($fp)
sw	$10, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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
sw	$12, 4($sp)
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
subu	$sp, $sp, 4
lw	$8, 8($fp)
li	$9, 1
subu	$8, $8, $9
sw	$8, 0($sp)
lw	$9, 0($fp)
sw	$9, 4($sp)
lw	$10, 4($fp)
sw	$10, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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
sw	$13, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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

lw	$9, ($sp)
addu	$sp, $sp, 4
lw	$8, ($sp)
addu	$sp, $sp, 4

#Pop all regs : end.
#**************************
move	$14, $v0
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_223
addu	$sp, $sp, 4
label_223:
move $v0, $14
jr	$ra
subu $sp, $fp, 0 # fix sp
j label_236
label_228:
lw	$15, 8($fp)
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_233
addu	$sp, $sp, 4
label_233:
move $v0, $15
jr	$ra
label_236:
label_237:
subu $sp, $fp, 0 # fix sp
.end __ex
__f:
lw	$16, 0($fp)
li	$17, 2
mulou	$16, $16, $17
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_247
addu	$sp, $sp, 4
label_247:
move $v0, $16
jr	$ra
label_250:
subu $sp, $fp, 0 # fix sp
.end __f
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
li	$8, 14
sw	$8, 0($sp)
li	$9, 13
sw	$9, 4($sp)
li	$10, 12
sw	$10, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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
move	$11, $v0
sw	$11, 0($sp)
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
li	$8, 18
sw	$8, 0($sp)
li	$9, 12
sw	$9, 4($sp)
li	$10, 6
sw	$10, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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
move	$11, $v0
sw	$11, 0($sp)
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
li	$8, 19
sw	$8, 0($sp)
li	$9, 15
sw	$9, 4($sp)
li	$10, 10
sw	$10, 8($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __ex
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
move	$11, $v0
sw	$11, 0($sp)
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
label_757:
li  $v0,  10 # call to end prog
syscall
.end main
subu $sp, $fp, 0 # fix sp
