.global main
.section ".text" 
.align 4

main:
   save %sp, -96, %sp
   
   clr %r17 !uppercase letters
   clr %r18 !lowercase letters
   clr %r19 !decimal digits
   clr %r20 !hexadecimal digits
   clr %r21 !newline character
   clr %r22 !whitespace characters
   clr %r23 !control chatacters
   clr %r24 !total number of characters

loop:
   call getchar ! Recieve character
   nop

   cmp %r8, -1
   be end
   nop 
!see if it reaches the end of the file

   mov %r8, %r16
   inc %r24
   nop
! increase total number of characters

if1:
   cmp %r16, 'A' !See number of Uppercase letters
   blt endif1
   nop
   
   cmp %r16, 'F'
   bgt endif1
   nop

then1:
   add %r17, 1, %r17 !If uppercase add 1
   add %r20, 1, %r20 !If hexadecimal add 1
endif1:  
  
if2:
   cmp %r16, 'G' !see rest of the uppercase letters
   blt endif2
   nop

   cmp %r16, 'Z'
   bgt endif2
   nop 

then2:
   add %r17, 1, %r17 !If uppercase add 1
endif2:

if3: 
   cmp %r16, 'a'
   blt endif3  
   nop

   cmp %r16, 'f'
   bgt endif3
   nop

then3:
   add %r18, 1, %r18 !If lowercase add 1
   add %r20, 1, %r20 !If hex add 1
endif3:

if4:
   cmp %r16, 'g'
   blt endif4
   nop

   cmp %r16, 'z'
   bgt endif4
   nop

then4:
   add %r18, 1, %r18 !if lowercase add 1
endif4:

if5:
   cmp %r16, '0'
   blt endif5
   nop

   cmp %r16, '9'
   bgt endif5
   nop

then5:
   add %r19, 1, %r19 !if decimal add 1
   add %r20, 1, %r20 !if hexadecimal add 1
endif5:

if6:
   cmp %r16, 0x0A
   be endif6 
   nop

then6: 
   add %r21, 1, %r21 !if newline add 1
endif6:

if7:
   cmp %r16, 0x09 !compare to whitespace
   be endif7
   nop

then7:
   add %r22, 1, %r22 !if whitespace add 1
endif7:

if8:
   cmp %r16, 0x0A !compare to whitespace
   be endif8
   nop

then8:
   add %r22, 1, %r22 !if whitespace add 1
endif8:

if9:
   cmp %r16, 0x20 !compate to whitespace
   be endif9
   nop

then9:
   add %r22, 1, %r22 !if whitespace add 1
endif9:

if10:
   cmp %r16, 0x00
   blt endif10
   nop
 
   cmp %r16, 0x1F
   bgt endif10
   nop

then10:
   add %r23, 1, %r23 !if control character add 1
endif10:

if11:
   cmp %r16, 0x7F
   be endif11
   nop

then11:
   add %r23, 1, %r23 !if control character add 1

endif11:

   call putchar
   nop

   ba loop
   nop

end:

   set fmt1, %r8
   mov %r17, %r9
   call printf
   nop
 
   set fmt2, %r8
   mov %r18, %r9
   call printf
   nop
   
   set fmt3, %r8
   mov %r19, %r9
   call printf
   nop

   set fmt4, %r8
   mov %r20, %r9
   call printf
   nop

   set fmt5, %r8
   mov %r21, %r9
   call printf
   nop

   set fmt6, %r8
   mov %r22, %r9
   call printf
   nop

   set fmt7, %r8
   mov %r23, %r9
   call printf
   nop
 
   set fmt8, %r8
   mov %r24, %r9
   call printf
   nop

   ret
   restore

fmt1:
   .asciz "\nNumber of uppercase letters = %d\n"
fmt2:
   .asciz "\nNumber of lowercase letters = %d\n"
fmt3:
   .asciz "\nNumber of decimal digits = %d\n"
fmt4:
   .asciz "\nNumber of hexadecimal digits = %d\n"
fmt5:
   .asciz "\nNumber of newline characters = %d\n"
fmt6:
   .asciz "\nNumber of whitespace characters = %d\n"
fmt7:
   .asciz "\nNumber of control characters = %d\n"
fmt8:
   .asciz "\nNumber of total characters = %d\n"
