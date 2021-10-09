; Name: "ohm.asm"
;
; Description: This file is responsible for calculating the
;              the resistance in ohms given amps and watts.
;
; Author: Aditya Shah
;         adityashah@csu.fullerton.edu
;
;                     GNU GENERAL PUBLIC LICENSE
;                        Version 3, 29 June 2007
;
;  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
;  Everyone is permitted to copy and distribute verbatim copies
;  of this license document, but changing it is not allowed.

extern printf
extern scanf

section .data
  welcome_message db "This program will help discover your circuit.", 10, "Please enter your name and then press enter: ", 0
  debug_message db "res: %lf", 10, 0
  amps_message db "Please enter your current in amps: ", 0
  watts_message db "Please enter your power in watts: ", 0
  thanks_message db "Thank you. Your resistance is %lf ohms.", 10, 0
  goodbye_message db "Goodbye, %s. Have a nice research party.", 10, "A zero will be returned to the operating system.", 10, 0
  text_input db "%s", 0
  double db "%lf", 0

section .bss
  name resb 16

section .text
  global ohm

ohm:
  push rbp
  mov rbp, rsp
  push rbx
  push rcx
  push rdx
  push rdi
  push rsi
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15
  pushf

  ; Print welcome message
  mov rax, 0
  mov rdi, welcome_message
  call printf

  ; Scan for name
  mov rdi, text_input
  mov rsi, name
  mov rdx, 16
  call scanf

  ; Print amps message
  mov rax, 0
  mov rdi, amps_message
  call printf

  ; Scan for current in amps
  mov rdi, double
  mov rsi, rsp
  call scanf

  ; Store current in xmm15
  movsd xmm15, [rsp]

  ; Print watts message
  mov rax, 0
  mov rdi, watts_message
  call printf

  ; Scan for power in watts
  mov rdi, double
  mov rsi, rsp
  call scanf

  ; Store power in xmm14
  movsd xmm14, [rsp]

  ; Calculate the resistance stored in xmm14
  mulsd xmm15, xmm15 ; Square the amps
  divsd xmm14, xmm15 ; Divide watts by the amps squared

  ; Print thanks message
  mov rax, 1
  mov rdi, thanks_message
  movsd xmm0, xmm14
  call printf

  ; Return the name
  mov rax, name

  ; 15 pops
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rsi
	pop rdi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	ret

; Copyright 2021 Aditya Shah