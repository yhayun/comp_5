.data
.text
__print:
li	$v0, 4
syscall
jr	$ra
__printi:
lw $a0, 0($sp)
li	$v0, 1
syscall
jr	$ra
__f:
lw	$8, -0($fp)
li	$9, 0
beq, $8, $9, label_14
j label_115
label_14:
subu	$sp, $sp, 4
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
subu $sp, $sp ,4
sw	$20, ($sp)
subu $sp, $sp ,4
sw	$21, ($sp)
subu $sp, $sp ,4
sw	$22, ($sp)
subu $sp, $sp ,4
sw	$23, ($sp)
subu $sp, $sp ,4
sw	$24, ($sp)
subu $sp, $sp ,4
sw	$25, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
li	$10, 0
sw	$10, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# Set fp above sp -- now in new function frame #
addu	$fp, $sp, 4
jal	   __printi
# getting the frame pointer back !
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$25, ($sp)
addu	$sp, $sp, 4
lw	$24, ($sp)
addu	$sp, $sp, 4
lw	$23, ($sp)
addu	$sp, $sp, 4
lw	$22, ($sp)
addu	$sp, $sp, 4
lw	$21, ($sp)
addu	$sp, $sp, 4
lw	$20, ($sp)
addu	$sp, $sp, 4
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
label_115:
subu	$sp, $sp, 4
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
subu $sp, $sp ,4
sw	$20, ($sp)
subu $sp, $sp ,4
sw	$21, ($sp)
subu $sp, $sp ,4
sw	$22, ($sp)
subu $sp, $sp ,4
sw	$23, ($sp)
subu $sp, $sp ,4
sw	$24, ($sp)
subu $sp, $sp ,4
sw	$25, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
lw	$11, -0($fp)
li	$12, 1
subu	$11, $11, $12
sw	$11, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# Set fp above sp -- now in new function frame #
addu	$fp, $sp, 4
jal	   __f
# getting the frame pointer back !
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$25, ($sp)
addu	$sp, $sp, 4
lw	$24, ($sp)
addu	$sp, $sp, 4
lw	$23, ($sp)
addu	$sp, $sp, 4
lw	$22, ($sp)
addu	$sp, $sp, 4
lw	$21, ($sp)
addu	$sp, $sp, 4
lw	$20, ($sp)
addu	$sp, $sp, 4
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
subu	$sp, $sp, 4
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
subu $sp, $sp ,4
sw	$20, ($sp)
subu $sp, $sp ,4
sw	$21, ($sp)
subu $sp, $sp ,4
sw	$22, ($sp)
subu $sp, $sp ,4
sw	$23, ($sp)
subu $sp, $sp ,4
sw	$24, ($sp)
subu $sp, $sp ,4
sw	$25, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
lw	$12, -0($fp)
sw	$12, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# Set fp above sp -- now in new function frame #
addu	$fp, $sp, 4
jal	   __printi
# getting the frame pointer back !
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$25, ($sp)
addu	$sp, $sp, 4
lw	$24, ($sp)
addu	$sp, $sp, 4
lw	$23, ($sp)
addu	$sp, $sp, 4
lw	$22, ($sp)
addu	$sp, $sp, 4
lw	$21, ($sp)
addu	$sp, $sp, 4
lw	$20, ($sp)
addu	$sp, $sp, 4
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
.globl main
main:
move $fp, $sp
subu	$sp, $sp, 4
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
subu $sp, $sp ,4
sw	$20, ($sp)
subu $sp, $sp ,4
sw	$21, ($sp)
subu $sp, $sp ,4
sw	$22, ($sp)
subu $sp, $sp ,4
sw	$23, ($sp)
subu $sp, $sp ,4
sw	$24, ($sp)
subu $sp, $sp ,4
sw	$25, ($sp)

#Push all regs : end.
#**************************
subu $sp, $sp ,4
sw	$fp, ($sp)
subu $sp, $sp ,4
sw	$ra, ($sp)
li	$13, 10
sw	$13, ($sp)
addu $sp, $sp ,4
subu	$sp, $sp, 4
# Set fp above sp -- now in new function frame #
addu	$fp, $sp, 4
jal	   __f
# getting the frame pointer back !
lw	$fp, ($sp)
addu	$sp, $sp, 4
#Pop all regs : begining.
#**************************

lw	$25, ($sp)
addu	$sp, $sp, 4
lw	$24, ($sp)
addu	$sp, $sp, 4
lw	$23, ($sp)
addu	$sp, $sp, 4
lw	$22, ($sp)
addu	$sp, $sp, 4
lw	$21, ($sp)
addu	$sp, $sp, 4
lw	$20, ($sp)
addu	$sp, $sp, 4
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