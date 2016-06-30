/* Rohini Shrivastava
   Section 101
   COmputer Project 6
*/

#include <math.h>
#include "/user/cse320/Projects/project06.support.h"
#include <stdio.h>
#include "/user/cse320/lib/bitlib.h"

// convert binary to base 16
int convert(unsigned x){
     int base16 = 0;
     int counter = 0;
     int remainder;
     while (x != 0){
          remainder = x%16;
          x /= 16;
          base16 += remainder*(2^counter);
          counter++;
     }
     return base16;
}


//recieves the operand and returns the first and second operand associated with
//the machine language
void operands(unsigned x, unsigned* y, unsigned* z){
     float registerarray[32] =
{00000000,01010101,02020202,03030303,04040404,05050505,06060606,07070707,11111111,12121212,13131313,14141414,15151515,16161616,17171717};
     unsigned i1 = x << 18;
     unsigned i = i1 >> 31; //shifting to find what i is 
     unsigned rs_ = x << 13;
     unsigned rs1 = rs_ >> 27;
     if (i == 0){    //if i = 0
          unsigned rs_2 = x << 27;
          unsigned rs2 = rs_2 >> 27;
          int reg1 = convert(rs1);
          int reg2 = convert(rs2);
          *y = registerarray[reg1-1];
          *z = registerarray[reg2-1];
          return;
     }
     else{    //if i = 1
          unsigned rs_2 = x<< 19;
          unsigned rs2 = rs_2 >> 19;
          *y = convert(rs1);
          *z = convert(rs2);
          return;    
     }
};

//performs the math function declared by x on the two operands and return the
//result
unsigned math_unit(unsigned x, unsigned y, unsigned z){
     unsigned add_int, sub_int, and_int, or_int, xor_int, andn_int;
     unsigned orn_int, xnor_int;
     if (x==000){ //adds the operands
          add_int = y + z;
          return add_int; 
     }
     else if (x==001){  //AND operation
          and_int = y & z;
          return and_int;
     }
     else if (x==010){  //OR operation
          or_int = y|z;
          return or_int;
     }
     else if (x==011){  //XOR operation
          xor_int = y ^ z;
          return xor_int;
     }
     else if (x==100){  //SUBTRACT operation
          sub_int = y-z;
          return sub_int;
     }
     else if (x==101){  //ANDN operation
          andn_int = y & ~z;
          return orn_int;
     }
     else if (x==110){  //ORN operation
          orn_int = y|~z;
          return orn_int;

     }
     else{
          xnor_int = y^~z;
          return xnor_int; 
     }
     return 0;
};

//shifts the first operand either to the right or left from the second operand
unsigned shift_unit(unsigned x, unsigned y, unsigned z){
     if (x == 01){
          unsigned left_shift = y << z;
          return left_shift;
     }
     else if (x==10){
          unsigned right_shift = y >> z;
          return right_shift;
     }
     else if (x==11){
          signed SRA_shift = y;
          signed SRA_shifting = SRA_shift >>z;
          unsigned unsign_SRA = SRA_shifting; 
          return unsign_SRA;     
     }
     else{
          return y;
     }
