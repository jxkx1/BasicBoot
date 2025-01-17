bits 16
org 0x2000

start:
    mov si, text  ; Load the address of "text" into SI
    call print_string   ; Call the print_string function

    ; Hang the system
hang:
    jmp hang

print_string:
    mov ah, 0x0E       ; BIOS teletype function
.next_char:
    lodsb              ; Load next byte from SI into AL
    cmp al, 0          ; Check if AL is zero
    je .done           ; If zero, end of string
    int 0x10          ; Otherwise, print the character
    jmp .next_char     ; Repeat for next character
.done:
    ret; Return from the function

text db 'This text is displayed by the bootloader!', 0