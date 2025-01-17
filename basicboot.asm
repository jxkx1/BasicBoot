bits 16
org 0x7C00

start:
    ; Set up the stack
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; Load the kernel
    mov si, 0x2000     ; Address where the kernel will be loaded
    mov bx, si         ; Store the address in bx

    ; Read the kernel from the disk
    mov ah, 0x02       ; Read sector function
    mov al, 1          ; Read one sector
    mov ch, 0          ; Cylinder 0
    mov cl, 2          ; Sector 2
    mov dh, 0          ; Head 0
    mov bx, si         ; Buffer to read into
    int 0x13          ; Call BIOS interrupt 0x13
    jmp bx             ; Jump to the kernel

times 510 - ($ - $$) db 0 ; Fill the rest of the sector with 0
dw 0xAA55                ; Boot signature