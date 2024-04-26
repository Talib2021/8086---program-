section     .text
; --------------------------------------------------
; Function to find the second largest number
; for a passed list of signed integers.
;
; Call:
; find_second_largest(lst, len, &second_largest);
;
; Arguments Passed:
;   1) rdi - address of array
;   2) rsi - length of passed array
;   3) rdx - address of variable for second largest number
;
; Returns:
;   second largest number (via reference)
global find_second_largest
find_second_largest:
push    r12
push    r13
; --------------
mov     r11, 0             ; i = 0
mov     r12d, 0            ; max = 0
mov     r13d, 0            ; second_max = 0

findLoop:
mov     eax, dword [rdi+r11*4]   ; get lst[i]

; Compare with max
cmp     eax, r12d
jle     check_second_max
mov     r13d, r12d         ; set second_max = max
mov     r12d, eax          ; set max = current element
jmp     continue_loop

check_second_max:
cmp     eax, r13d
jle     continue_loop      ; If current element is less than or equal to second_max, continue loop
mov     r13d, eax          ; set second_max = current element

continue_loop:
inc     r11                 ; i++
cmp     r11, rsi
jb      findLoop

mov     dword [rdx], r13d  ; return second largest number

pop     r13
pop     r12
ret