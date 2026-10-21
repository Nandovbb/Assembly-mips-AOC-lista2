.data 
	msg1: .asciiz "\nDigite o primeiro valor: "
	msg2: .asciiz "\nDigite o segundo valor: "
	msg3: .asciiz "\nA diferença do maior para o menor é: "
.text
main:
#chama mensagem 1
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0 #Salva o primeiro valor

#chama mensagem 2
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0 #Salva o segundo valor

#conta
bgt $t0, $t1, maior
j menor

maior:
sub $t0, $t0, $t1 #maior-menor
j fim

menor:
sub $t0, $t1, $t0 #maior-menor
j fim

fim:
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t0
syscall