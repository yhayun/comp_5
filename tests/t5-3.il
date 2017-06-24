.data
div_zero_label: .asciiz "Error division by zero
"
string_label_0:	.asciiz "\t"
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
__fib:
lw	$8, 0($fp)
li	$9, 0
beq, $8, $9, label_21
j label_16
label_16:
lw	$10, 0($fp)
li	$11, 1
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
jal	   __fib
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
lw	$8, 0($fp)
li	$9, 2
subu	$8, $8, $9
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fib
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
addu	$13, $13, $14
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_144
addu	$sp, $sp, 4
label_144:
move $v0, $13
jr	$ra
label_147:
subu $sp, $fp, 0 # fix sp
.end __fib
.globl main
main:
move $fp, $sp
li	$14, 0
# inserting var = i
subu $sp, $sp ,4
sw	$14, ($sp)
# starting While loop
label_158:
lw	$15, -4($fp)
li	$16, 10
blt, $15, $16, label_163
j label_345
label_163:
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
lw	$8, -4($fp)
sw	$8, 0($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __fib
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
lw	$17, -4($fp)
li	$18, 1
addu	$17, $17, $18
li	$18, 10
blt, $17, $18, label_266
j label_338
label_266:
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
label_338:
lw	$19, -4($fp)
li	$20, 1
addu	$19, $19, $20
sw	$19, -4($fp)
subu $sp, $fp, 4 # fix sp
j label_158
label_345:
subu $sp, $fp, 4 # fix sp
# End While Loop
label_348:
li  $v0,  10 # call to end prog
syscall
.end main
subu $sp, $fp, 4 # fix sp
