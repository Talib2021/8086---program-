section     .text
; --------------------------------------------------
; Function to generate the first n Fibonacci numbers
; Call:
; generate_fibonacci(n, &fib_array);
;
; Arguments Passed:
;   1) rdi - n (number of Fibonacci numbers to generate)
;   2) rsi - address of the array to store Fibonacci numbers
;
; Generates Fibonacci numbers up to n and stores them in the array
; Returns:
;   None
global generate_fibonacci
generate_fibonacci:
    ; Initialize first two Fibonacci numbers
    mov     dword [rsi], 0         ; F[0] = 0
    mov     dword [rsi + 4], 1     ; F[1] = 1

    ; Start generating Fibonacci numbers from F[2] to F[n]
    mov     rax, 2                 ; Counter for current Fibonacci number
.loop:
    cmp     rax, rdi               ; Compare counter with n
    jge     .done                   ; If counter >= n, finish
    mov     r8d, dword [rsi + rax * 4 - 8]   ; Get F[i-2]
    mov     r9d, dword [rsi + rax * 4 - 4]   ; Get F[i-1]
    add     r8d, r9d               ; F[i] = F[i-1] + F[i-2]
    mov     dword [rsi + rax * 4], r8d       ; Store F[i] in the array
    inc     rax                     ; Increment counter
    jmp     .loop                   ; Repeat loop

.done:
    ret