#include "/user/cse320/Projects/project06.support.h"
#include <stdio.h>

int main(){
     unsigned out1, out2;

//testing the operand function
     operands(0x484011, & out1, & out2);
     printf ("operand1: %08o Operand2: %08o \n", out1, out2);

//testing the math_unit function to make sure it all works
     unsigned total_sum = math_unit(000, 0x00000001, 0x00000001);
     printf ("Add: %08x \n", total_sum);  

     unsigned int total_and = math_unit(001, 0x0000000c, 0x0000000a);
     printf ("And: %08x \n", total_and);

     unsigned int total_or = math_unit(010, 0x0000000c, 0x0000000a);
     printf ("Or: %08x \n", total_or);

     unsigned int total_xor = math_unit(011, 0x0000000c, 0x0000000a);
     printf ("Xor: %08x \n", total_xor);

     unsigned int total_sub = math_unit(100, 0x0000000c, 0x00000000a);
     printf ("Subtract: %08x \n", total_sub);

     unsigned int total_andn = math_unit(101, 0x0000000c, 0x0000000a);
     printf("Andn: %08x \n", total_andn);

     unsigned int total_orn = math_unit(110, 0x0000000c, 0x0000000a);
     printf("Orn: %08x \n", total_orn);

     unsigned int total_xnor = math_unit(111, 0x0000000c, 0x0000000a);
     printf("Xnor: %08x \n", total_xnor);

//testing the shift function
     unsigned SLL_shift = shift_unit(01, 0x00000001, 0x00000001);
     printf("Shift Left: %08x \n", SLL_shift);

     unsigned SRL_shift = shift_unit(10, 0x00000002, 0x00000001);
     printf("Shift RIght Logical: %08x \n", SRL_shift);

     unsigned SRA_shift = shift_unit(11, 0x00000002, 0x00000001);
     printf("Shift Right Arithmetic: %08x \n", SRA_shift);
     return 0;

}
