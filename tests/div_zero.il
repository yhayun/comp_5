.data
div_zero_label: .asciiz "Error division by zero
"
string_label_0:	.asciiz "This should print\n"
string_label_1:	.asciiz "This shouldn't print"
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
j label_13
label_13:
li	$8, 1
li	$9, 0
blt, $8, $9, label_25
j label_22
# here we can make sure we CLEAR the stack
beq $fp, $sp, label_21
addu	$sp, $sp, 4
label_21:
label_22:
li $v0, 1
j label_27
label_25:
li $v0, 0
label_27:
move $sp, $fp
jr	$ra
label_30:
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

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
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
li $10, 1
beq $10, $v0, label_87
j label_73
label_73:
li	$10, 5
li	$11, 0
li $12, 0 
bne $12, $11, label_82
la $a0, div_zero_label
jal __print
li $v0, 10
syscall
label_82:
divu	$10, $10, $11
li	$11, 1
beq, $10, $11, label_87
j label_132
label_87:
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
subu $sp, $fp, 0 # fix sp
label_132:
li	$12, 0
# inserting var = t
subu $sp, $sp ,4
sw	$12, ($sp)
li	$13, 5
lw	$14, -4($fp)
li $15, 0 
bne $15, $14, label_145
la $a0, div_zero_label
jal __print
li $v0, 10
syscall
label_145:
divu	$13, $13, $14
li	$14, 1
beq, $13, $14, label_208
j label_150
label_150:
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
# clear our argument !
# Set fp above sp -- now in new function frame #
move $fp, $sp
jal	   __f
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
li $15, 1
beq $15, $v0, label_208
j label_265
label_208:
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
subu $sp, $fp, 4 # fix sp
label_265:
label_266:
li  $v0,  10 # call to end prog
syscall
.end main
subu $sp, $fp, 4 # fix sp
