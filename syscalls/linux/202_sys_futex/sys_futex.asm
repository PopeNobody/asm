; linuxthor
; 
; sys_futex example
; 
; assemble with:
; nasm -f elf64 -o sys_futex.o sys_futex.asm
; ld sys_futex.o -o sys_futex 

BITS 64

%define FUTEX_WAIT              0
%define FUTEX_WAKE              1
%define FUTEX_FD                2
%define FUTEX_REQUEUE           3
%define FUTEX_CMP_REQUEUE       4
%define FUTEX_WAKE_OP           5
%define FUTEX_LOCK_PI           6
%define FUTEX_UNLOCK_PI         7
%define FUTEX_TRYLOCK_PI        8
%define FUTEX_WAIT_BITSET       9
%define FUTEX_WAKE_BITSET       10
%define FUTEX_WAIT_REQUEUE_PI   11
%define FUTEX_CMP_REQUEUE_PI    12

%define FUTEX_PRIVATE_FLAG      128
%define FUTEX_CLOCK_REALTIME    256
%define FUTEX_CMD_MASK          ~(FUTEX_PRIVATE_FLAG | FUTEX_CLOCK_REALTIME)

%define FUTEX_WAIT_PRIVATE        (FUTEX_WAIT | FUTEX_PRIVATE_FLAG)
%define FUTEX_WAKE_PRIVATE        (FUTEX_WAKE | FUTEX_PRIVATE_FLAG)
%define FUTEX_REQUEUE_PRIVATE     (FUTEX_REQUEUE | FUTEX_PRIVATE_FLAG)
%define FUTEX_CMP_REQUEUE_PRIVATE (FUTEX_CMP_REQUEUE | FUTEX_PRIVATE_FLAG)
%define FUTEX_WAKE_OP_PRIVATE     (FUTEX_WAKE_OP | FUTEX_PRIVATE_FLAG)
%define FUTEX_LOCK_PI_PRIVATE      (FUTEX_LOCK_PI | FUTEX_PRIVATE_FLAG)
%define FUTEX_UNLOCK_PI_PRIVATE     (FUTEX_UNLOCK_PI | FUTEX_PRIVATE_FLAG)
%define FUTEX_TRYLOCK_PI_PRIVATE      (FUTEX_TRYLOCK_PI | FUTEX_PRIVATE_FLAG)
%define FUTEX_WAIT_BITSET_PRIVATE       (FUTEX_WAIT_BITSET | FUTEX_PRIVATE_FLAG)
%define FUTEX_WAKE_BITSET_PRIVATE         (FUTEX_WAKE_BITSET | FUTEX_PRIVATE_FLAG)
%define FUTEX_WAIT_REQUEUE_PI_PRIVATE       (FUTEX_WAIT_REQUEUE_PI | \
                                               FUTEX_PRIVATE_FLAG)
%define FUTEX_CMP_REQUEUE_PI_PRIVATE          (FUTEX_CMP_REQUEUE_PI | \
                                                FUTEX_PRIVATE_FLAG)

global _start
_start:
    mov rax, 202          ;  sys_futex
    mov rdi, futex
    mov rsi, FUTEX_WAKE
    mov rdx, 1
    syscall  

    mov rax, 60           ;  sys_exit
    mov rdi, 0
    syscall

section .bss 
    futex resd 1

