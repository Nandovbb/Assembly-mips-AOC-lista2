.data 
	msg1: .asciiz "\nDigite sua primeira nota: "
	msg2: .asciiz "\nDigite sua segunda nota: "
	msg3: .asciiz "\nDigite sua terceira nota: "
	msg4: .asciiz "\nDigite sua quarta nota: "
	msg5: .asciiz "sua média é: "
	msga: .asciiz "\nAPROVADO "
	msge: .asciiz "\nEXAME "
	msgr: .asciiz "\nRETIDO "
.text
main:
#chama mensagem 1
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0 #Salva a primeira nota

#chama mensagem 2
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t2, $v0 #Salva a segunda nota

#chama mensagem 3
li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall
move $t3, $v0 #Salva a terceira nota

#chama mensagem 4
li $v0, 4
la $a0, msg4
syscall

li $v0, 5
syscall
move $t4, $v0 #Salva a quarta nota

#contas
add $t1, $t1, $t2 #nota 1 + nota 2
add $t3, $t3, $t4 #nota 3 + nota 4
add $t1, $t1, $t3 #(n1+n2)+(n3+n4)
div $t1, $t1, 4 #soma de todas as notas dividido por 4

bge $t1, 6, aprovado #se media >= 6 aprovado
bge $t1, 3 ,exame #se ele passou não é 6
j retido #se passou as duas não é nem 3 nem 6 então retido

aprovado:
li $v0, 4
la $a0, msga
syscall #chama mensagem de aprovado
j fim

exame:
li $v0, 4
la $a0, msge #chama mensagem de exame
syscall

retido:
li $v0, 4
la $a0, msgr #chama mensagem de retido
syscall

fim:
li $v0, 4
la $a0, msg5 #chama mensagem 5
syscall

li $v0, 1
move $a0, $t1 #chama a média
syscall