.data 
prompt1:  .asciiz "digite o primeiro número: "
prompt2:  .asciiz "digite o segundo número: "
msg_maior: .asciiz " o maior número é: "
msg_iguais: .asciiz "os números são iguais.\n"
msg_soma:  .asciiz "\n A soma dos impares entre eles são: "

.text 
.globl main

main: 

li $v0, 4
la $a0, prompt1
syscall
li $v0, 5 
move $t0, $v0 

li $v0, 4
la $a0, prompt2 
syscall
li $v0, 5 
syscall
move $t1, $v0 

beq $t0, $t1, iguais
blt $t0, $t1, num1_maior

 num1_maior: 
 move $t2, $t0
 move $t3, $t1
 syscall 
 li $v0, 4
 la $a0, msg_maior
 syscall 
 li $v0, 1
 move $a0, $t2
 syscall
 j  calc_impares

  iguais:
     li $t4, 0
     addi $t5, $t3, 1 
 calc_impares:
 li $t4, 0
 addi $t5, $t3, 1
 
 loop:
 
 bge $t5, $t2, fim_loop
 li $t6, 2
 rem $t7, $t5, $t6
 beqz $t7, proximo
 add $t4, $t4, $t5
 
 proximo:
 addi $t5, $t5, 1
 j loop
 fim_loop:
 li $v0, 4
 la $a0, msg_soma
 syscall
 li $v0, 1 
 move $a0, $t4
 syscall
 li $v0, 10
 syscall
 
  
