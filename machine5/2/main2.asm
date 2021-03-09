include console.inc 

extern In_text@0: proc, Out_text@0: proc, Find_min_word@0: proc

.data 
        N equ 5 ; количество слов
        K equ 6 ; длина одного слова
        Arr_of_words db N dup( K dup(?))
.code 
start:
        push K
        push N
        push offset Arr_of_words
        call In_text@0
        newline

        push K
        push N
        push offset Arr_of_words
        call Out_text@0
        newline

        push K
        push N
        push offset Arr_of_words
        call Find_min_word@0
        exit
end start