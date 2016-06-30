   .global negate
   .section ".text"
   .align 4

negate: !negates the number
   save %sp, -96, %sp

   subcc %g0, %i0, %i0
   ret 
   restore

   .global absolute

absolute: !finds the absolute valie of the number
   save %sp, -96, %sp

   cmp %i0, %g0
   blt isneg
   nop 

   ret
   restore
isneg:
   smul %i0, -1, %i0
   nop

then: 
   ret 
   restore

   .global add
add: !adds the number together and looks to see if there is overflow
   save %sp, -96, %sp

   addcc %i0, %i1, %i0
   bvs error
   nop
 
   ret
   restore
error: !if overflow output 0x80000000
   set 0x80000000, %i0
   nop
   
   ret
   restore

   .global sub
sub: !subtract the two numbers and check for overflow   
   save %sp, -96, %sp
   
   subcc %i0, %i1, %i0
   bvs error1
   nop

   ret
   restore
error1:
   set 0x80000000, %i0
   nop
   
   ret
   restore

   .global mul
mul: !multiply the two numbers and use y registers to increase size to 64 bits

   save %sp, -96, %sp

   smulcc %i0, %i1, %i0
   mov %y, %l0
   mov %y, %l1

   mov %i0, %l0
   sra %l0, 31, %l3
   cmp %l3, %l1
   bvs error2 !check for overflow
   nop

   ret
   restore
error2:
   set 0x80000000, %i0
   nop

   ret
   restore

   .global divide
divide: !divide the two number and check for overflow
   save %sp, -96, %sp
   
   cmp %i1, %g0
   blt error3  
   nop

   cmp %i0, %i1 !if the first num is < second set output to 0
   blt error9
   nop
 
   mov %y, %l0
   sdivcc %i0, %i1, %i0
   mov %i0, %l0  
   sll %l0, 31, %l2 
   cmp %l2, %l0
   bvs error3
   nop 

   ret
   restore
error9:
   set 0, %i0
   nop
  
   ret
   restore
error3:
   set 0x80000000, %i0
   nop

   ret
   restore

   .global remain
remain: !find the remainder after dividing the two numbers
   save %sp, -96, %sp
   
   cmp %i1, %g0
   nop

   sdivcc %i0, %i1, %i2
   smulcc %i2, %i1, %i3
   subcc %i0, %i3, %i0
   bvs error4
   nop

   ret
   restore
error4:
   set 0x80000000, %i0
   nop

   ret
   restore

   .global power
power: !raise the first number to the second number
   save %sp, -96, %sp

   cmp %i1, %g0
   blt error5
   nop

   mov %i0, %l0 
   set 1, %l1

powloop: !loops to multiply num1 until it reaches num2 loops
   cmp %i1, %l1
   be endpower
   nop

   smulcc %i0, %l0, %i0
   add %l1, 1, %l1
   ba powloop
   nop
error5:
   set 0x80000000, %i0
   nop

   ret
   restore
endpower:
   ret
   restore

   .global factorial
factorial: !find the factorial of num1
   save %sp, -96, %sp

   cmp %i0, %g0
   blt error6
   nop
  
   mov %i0, %l1
   subcc %i0, 1, %l0

factloop: !loops until num1 becomes 1
   cmp %l1, 1
   be endfact
   nop

   smulcc %i0, %l0, %i0
   subcc %l0, 1, %l0
   subcc %l1, 1, %l1
   ba factloop
   nop
error6:
   set 0x8000000, %i0
   nop
   
   ret
   restore
endfact:
   ret
   restore
