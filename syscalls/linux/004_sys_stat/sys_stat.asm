; linuxthor
;
; sys_stat example
;
; assemble with:
; nasm -f elf64 -o sys_stat.o sys_stat.asm
; ld sys_stat.o -o sys_stat 

BITS 64

struc stat
    .dev_t  resq 1    ; id of device containing file
    .ino_t  resq 1    ; inode number
    .mode_t resd 1    ; file type & mode
    .nlnk_t resq 1    ; number hard links
    .uid_t  resd 1    ; uid of owner
    .gid_t  resd 1    ; gid of owner
    .devr_t resq 1    ; device id (special file)
    .off_t  resq 1    ; size in bytes
    .blks_t resq 1    ; blocksize for i/o
    .blkc_t resq 1    ; number of blocks
endstruc

global _start
_start:

    mov rax, 4            ;  sys_stat
    mov rdi, file
    mov rsi, statstr
    syscall 

    mov rax, 60           ;  sys_exit
    mov rdi, [statstr + stat.ino_t]
    syscall

section .data 
    file  db  '/etc/passwd',0

section .bss
    statstr   resb  stat_size 
