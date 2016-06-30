
#include "/user/cse320/Projects/project10.support.h"
#include <stdio.h>
#include <math.h>
 
int main(){
   
   union dp_item num1;
   union dp_item num2;
   num1.drep = -2;
   num2.drep = 3;

   double output1 = absolute(num1.drep);
   printf("The absolute of %e is ", num1.drep);
   printf("%e\n", output1); 
   double output2 = absolute(num2.drep);
   printf("Absolute is %e\n", output2);

   double output3 = modulo(num1.drep, num2.drep);
   printf("The modulus is %e\n", output3);

   double output4= factorial(num1.drep);
   printf("factorial is %e\n", output4);
  
   double output5 = power(num1.drep, 3);
   printf("The power is %e\n", output5); 
   return 0;
}
