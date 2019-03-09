.text

	main:
	
	# $s0 = Indice do  vetor
	
	
	enquanto:						#ENQUANTO
		sw $zero, vetor($s0)		#GUARDA 0 NO ESPAÇO $s0 do VETOR
		addi $s0, $s0, 4			#INCREMENTA 4 NO CONTADOR $s0
	ble $s0, 36, enquanto			#FIM-ENQUANTO
	
	li $v0, 4						#ESCRITA
	la $a0, welcome					#ATRIBUI MENSAGEM welcome AO $a0
	syscall
	
	valor:
	li $v0, 4						#ESCRITA
	la $a0, digite					#ATRIBUI MENSAGEM digite AO $a0
	syscall
	li $v0, 5						#LEITURA
	syscall
	bgt $v0, 1000, valor			#VERIFICA SE O VALOR DIGITADO É MAIOR QUE 1000
	blt $v0, 1, valor				#VERIFICA SE O VALOR DIGITADO É MENOR QUE 1
	move $t1, $v0					#ATRIBUI AO $t1 O VALOR DIGITADO
	li $s4, 1						#ATRIBUI AO $s4 O VALOR 1 PARA ATRIBUIR COM SW NO VETOR

	
	enquanto2:						#ENQUANTO2
		rem $t2, $t1, 2				#ATRIBUI AO $t2 O MOD DE $t1 por 2
		beq $t2, 0, serestozero		#SE $t2 FOR IGUAL A 0 PULA PARA serestozero
		bne $t2, 0, senaozero		#SE $t2 NÃO FOR IGUAL A 0 PULA PARA senaozero
		serestozero:
		sw $zero, vetor($s1)		#GUARDA 0 NA POSIÇÃO $s1 DO VETOR
		j comparaenquanto			#PULA PARA O comparaenquanto
		senaozero:					
		sw $s4, vetor($s1)			#GUARDA 1 NA POSIÇÃO $s1 DO VETOR
		j comparaenquanto			#PULA PARA O comparaenquanto
		comparaenquanto:
		div $t1, $t1, 2				#DIVIDE O $t1 POR 2 E ATRIBUI AO $t1
		addi $s1, $s1, 4 			#INCREMENTA 4 NO CONTADOR $s1
	bgt $t1, $zero enquanto2		#FIM-ENQUANTO2

	li $v0, 4						#ESCRITA
	la $a0, bye						#ATRIBUI MENSAGEM bye AO $a0
	syscall	
	
	li $s5, 36						#CARREGA 36 NO $s5 PARA FAZER A IMPRESSÃO DO VETOR DE TRÁS PRA FRENTE
	
	printando:						#ENQUANTO-PRINTANDO
		lw $t6, vetor($s5)			#CARREGA NO $t6 O VALOR DO VETOR $s5
		li $v0, 1 					#ESCRITA
		add $a0, $t6, $zero			#ATRIBUI AO $a0 o VALOR DO $t6
		syscall
		sub $s5, $s5, 4 			#INCREMENTA 4 NO CONTADO $s5
	bge $s5, 0, printando			#FIM-ENQUANTO-PRINTANDO
	
	
.data
	vetor: 		.space 40 
	welcome:	.asciiz "Algoritmo conversao para binario\n"
	digite:		.asciiz "\nDigite o valor inteiro a ser convertido (entre 1 e 1000): "
	bye:		.asciiz "\n\n\n
                     ..|a@@@@@@@@@@@@@@@@@@@@@@@@@@a|..
                .,a@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@a,.
              ,a@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@@@@@@@@@a,
             a@@@@@@@@@@@@@@@@@@@@@' . `@@@@@@@@@@@@@@@@@@@@@@@@a
             ;`@@@@@@@@@@@@@@@@@@'   .   `@@@@@@@@@@@@@@@@@@@@@';
             ;@@@`@@@@@@@@@@@@@'     .     `@@@@@@@@@@@@@@@@'@@@;
             ;@@@;,.aaaaaaaaaa       .       aaaaaaaaaaaa´´,;@@@;
             ;;@;;;;@@@@@@@@;@      @.@      ;@@@;;;@@@@@@;;;;@@;
             ;;;;;;;@@@@;@@;;@    @@ . @@    ;;@;;;;@@;@@@;;;;;;;
             ;;;;;;;;@@;;;;;;;  @@   .   @@  ;;;;;;;;;;;@@;;;;@;;
             ;;;;;;;;;;;;;;;;;@@     .     @@;;;;;;;;;;;;;;;;@@@;
         ,%%%;;;;;;;;@;;;;;;;;       .       ;;;;;;;;;;;;;;;;@@;;%%%,
      .%%%%%%;;;;;;;@@;;;;;;;;     ,%%%,     ;;;;;;;;;;;;;;;;;;;;%%%%%%,
     .%%%%%%%;;;;;;;@@;;;;;;;;   ,%%%%%%%,   ;;;;;;;;;;;;;;;;;;;;%%%%%%%,
     %%%%%%%%`;;;;;;;;;;;;;;;;  %%%%%%%%%%%  ;;;;;;;;;;;;;;;;;;;'%%%%%%%%
     %%%%%%%%%%%%`;;;;;;;;;;;;,%%%%%%%%%%%%%,;;;;;;;;;;;;;;;'%%%%%%%%%%%%
     `%%%%%%%%%%%%%%%%%,,,,,,,%%%%%%%%%%%%%%%,,,,,,,%%%%%%%%%%%%%%%%%%%%'
       `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
           `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
                  '''''''''''''''''''''''''''''''''''''''''''\n\n\nValor digitado em binario:"
				  
#Henrique Lima de Oliveira