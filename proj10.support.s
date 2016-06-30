  .section ".text"
   .global absolute
   !find the absolute value of the double number
absolute:
   save %sp, -112, %sp

   std %i0, [%sp+96] !set the input as an f register floating point
   ldd [%sp+96], %f2

   set 0, %l0 !set 0 as a floating point to be able to compare
   st %l0, [%sp+96]
   ld [%sp+96], %f4
   fitod %f4, %f4

   fcmpd %f2, %f4
   fble negval !branch if less than or equal to 0              
   nop
   call endif
   nop
negval:
   fsubd %f4, %f2, %f6
   fmovd %f6, %f0
   ret
   restore
   nop
endif:
   fmovd %f2, %f0
   ret
   restore
   nop

   .global modulo
   !find x mod y
modulo:
   save %sp, -112, %sp
   
   set zero, %l0
   ldd [%l0], %f10

   std %i0, [%sp+96]
   ldd [%sp+96], %f4

   std %i2, [%sp+104]
   ldd [%sp+104], %f6

   fcmpd %f6, %f10 !compare to see if y is 0
   fbe iszero
   nop

   fcmpd %f4, %f10 !compare to see the sign of x 
   fbl isneg
   nop

   fcmpd %f6, %f4 !see how x compares to y
   fbg isless
   nop
   fbe issame
   nop
   fbl isgreater
   nop
   ret
   restore
 
iszero:
   set nan, %l1
   ldd [%l1], %f0
   ret
   restore
   nop 

issame:
   fmovd %f10, %f0
   nop
   ret
   restore

isless:
   fmovd %f4, %f0
   nop
   ret
   restore

isgreater:
   fdivd %f4, %f6, %f8
   fdtoi %f8, %f8
   fitod %f8, %f8
   fmuld %f6, %f8, %f8
   fsubd %f4, %f8, %f0
   ret
   restore 

isneg:
   set neg1, %l5     
   ldd [%l5], %f12
   nop

   fdivd %f4, %f6, %f8
   fdtoi %f8, %f8
   fitod %f8, %f8
   fmuld %f6, %f8, %f8
   fsubd %f4, %f8, %f4
   fmuld %f4, %f12, %f0
   nop

   ret 
   restore

   .global factorial
   !finds the factorial of x
factorial:
   save %sp, -112, %sp
   
   st %i0, [%sp+96] !loads x as a floating point
   ld [%sp+96], %f2
   fitod %f2, %f2
   ld [%sp+96], %f6
   fitod %f6, %f6
   
   set zero, %l1
   ldd [%l1], %f8
 
   fcmpd %f2, %f8
   fbl negfact
   nop
   fbe zerofact
   nop

   set one, %l3 !register is used to cound the number of loops
   ldd [%l3], %f10
   nop

posfact: !loops to find factorial
   fcmpd %f6, %f10 
   nop
   fble endfact
   nop
  
   fsubd %f6, %f10, %f6
   fmuld %f2, %f6, %f2
   fba posfact
   nop

negfact: !if factorial is negative give error
   set nan, %l0
   ldd [%l0], %f0
   nop
   ret
   restore

zerofact: !if factorial is 0 give 1
   set one, %l4
   ldd [%l4], %f0
   nop
   ret
   restore

endfact:
   fmovd %f2, %f0
   ret
   restore

   .global power
   ! find x to the y power
power:
   save %sp, -112, %sp

   std %i0, [%sp+96] !sets the input as 2 floating points
   ldd [%sp+96], %f2
   ldd [%sp+96], %f4

   mov %i2, %l0
   cmp %l0, 0
   be zeropower
   nop
   bl negpower
   nop 

pospower:
   cmp %l0, 1
   ble endpower
   nop

   fmuld %f2, %f4, %f4
   sub %l0, 1, %l0
   ba pospower
   nop

zeropower:
   set one, %l4
   ldd [%l4], %f0
   nop
   ret
   restore

negpower:
   set nan, %l5
   ldd [%l5], %f0
   nop
   ret
   restore

endpower:
   fmovd %f4, %f0
   ret
   restore

   .global cosine !finds cosine
cosine:
   ret
   restore

   .section ".data"
   .align 8

nan: .double 0rnan
zero: .double 0r0.0
one: .double 0r1.0
neg1: .double 0r-1.0
