  .section ".text"
   .align 4

   .global search

search:
   save %sp, -96, %sp
   mov %i0, %l0
   mov %i1, %l1
   mov %i2, %l2
   nop

   lduh [%i0+2], %l5 !find number of players
   ld [%i0+4], %l6 !find player table
   set 0, %l7

loopsearch:
   cmp %l7, %l5 !see if the end of the table has been reached
   bg notfound
   nop

   smul %l7, 36, %l4
   lduh [%l6+%l4], %l3 !compare the input jersey num to jersey number on table
   cmp %l1, %l3
   be foundit
   nop

   inc %l7   
   ba loopsearch 
   nop

foundit:
   st %l6, [%i2+0]
   set 1, %i0 !Found the jersey number
   nop

   ret 
   restore

notfound:
   set 0, %i0 !cannot find the jersey number`
   nop
  
   ret 
   restore
endif:

 
   

.global delete

delete:
   save %sp, -96, %sp
   mov %i0, %l0
   mov %i1, %l1
   mov %l0, %o0
   mov %l1, %o1
   mov %sp, %o2

   call search !call search to see if it can be found in the table
   nop
  
   cmp %o0, 0 !if not found, it can't be deleted
   be cannotdelete
   nop
 
   cmp %o0, 1 !if found it can be deleted
   be candelete
   nop

candelete:
   ld [%o2], %l2
   set 1, %i0
   ret
   restore

cannotdelete:
   set 0, %i0
   ret
   restore

.global insert

insert:
   save %sp, -96, %sp
   
   mov %i0, %l0
   mov %i1, %l1
   mov %i2, %l2 
   mov %i3, %l3
   mov %i4, %l4 
   mov %i5, %l5

   mov %i0, %o0
   mov %i1, %o1
   mov %sp, %o2
   call search !call search to see if it already is in table
   nop

   cmp %o0, 1 !if it is in the table it cannot be inserted again
   be cannotinsert
   nop
  
   cmp %o0, 0
   be inserting
   nop

inserting:
   set 1, %i0
   ret
   restore
   
cannotinsert:
   set 0, %i0
   ret
   restore

