	.file	"fact.c"
	.text
	.globl	fact
	.type	fact, @function
fact:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp ;Эта инструкция резервирует 16 байтов для локальных переменных
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L2 ;  сравнивают значение локальной переменной с нулем и переходят к метке .L2 чтобы обработать случай базового случая рекурсивной функции
	movl	$1, %eax
	jmp	.L3 ; Эти инструкции устанавливают значение 1 в регистре %eax и переходят к метке .L3, чтобы вернуть это значение в качестве результата функции
.L2:
	cmpl	$1, -4(%rbp)
	jne	.L4
	movl	$1, %eax
	jmp	.L3 ; проверяют, равно ли значение локальной переменной 1, и переходят к метке .L4
.L4:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fact
	imull	-4(%rbp), %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc ; устанавливают значение 1 в регистре %eax
.LFE0:
	.size	fact, .-fact
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
