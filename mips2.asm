.data 
	msg1: .asciiz "\nDigite o valor do raio: "
	msg2: .asciiz "\nO comprimento da circunferência é: "
.text
main:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva o raio

#Calcula o comprimento da circunferência
mul $t0, $t0, 6 # raio * (2*pi)

#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#digita o valor da área
li $v0, 1
move $a0, $t0
syscall