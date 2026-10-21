.data 
	msg1: .asciiz "\nDigite a altura do trapézio: "
	msg2: .asciiz "\nDigite o comprimneto: "
	msg3: .asciiz "\nDigite a largura: "
	msg4: .asciiz "\nO volume do paralelepípedo é: "
.text
main:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva a altura

#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#le o segundo valor digitado
li $v0, 5
syscall
move $t1, $v0 #salva o comprimento


#chama a mensagem 3
li $v0, 4
la $a0, msg3
syscall

#le o terceiro valor digitado
li $v0, 5
syscall
move $t2, $v0 #salva a largura

#Calcula a área do trapezio
mul $t0, $t0, $t1 # altura * comprimento
mul $t2, $t0, $t2 # (altura*comprimento) * largura
	
#chama a mensagem 4
li $v0, 4
la $a0, msg4
syscall

#digita o valor da área
li $v0, 1
move $a0, $t2
syscall