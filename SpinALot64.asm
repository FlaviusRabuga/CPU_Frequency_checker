section .text
    global SpinALot

SpinALot:
    ; Spin in a loop for 50*spinCount cycles
    ; On out-of-order CPUs the sub and jne will not add
    ; any execution time.

    ; SpinALot PROC ; (const int spinCount : rcx)
    ; spinCount is already in ecx
    mov ecx, edi

start:
    ; Ten dependent adds
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    ; Ten more dependent adds
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    ; Ten more dependent adds
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    ; Ten more dependent adds
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    ; Ten more dependent adds
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax

    sub ecx, 1
    jne start

    ret
