#include <stdio.h>
#include "/user/cse320/Projects/project08.support.h"

int main(){
     int num1 = 2;
     int num2 = 3;
 
     int negated = negate(num1);
     printf("The negation of %d is %i\n", num1, negated);

     int absol = absolute(num1);
     printf("The absolute of %d is %i\n", num1, absol);

     int absol1 = absolute(num2);
     printf("the absolute of %d is %i\n", num2, absol1);

     int add1 = add(num1, num2);
     printf("The addition of %d, %i, is ", num1, num2);
     printf("%i\n", add1);

     int sub1 = sub(num1, num2);
     printf("The subtraction of %d and %i is ", num1, num2);
     printf("%i\n", sub1);

     int mul1 = mul(num1, num2);
     printf("The multiplication of %d and %i is ", num1, num2);
     printf("%i\n", mul1);

     int div1 = divide(num1, num2);
     printf("The division of %d and %i is ", num1, num2);
     printf("%i\n", div1);
     
     int rem1 = remain(num1, num2);
     printf("The remainer of %d divided by %i is ", num1, num2);
     printf("%i\n", rem1);

     int pow1 = power(num1, num2);
     printf("%d raised the the %i is ", num1, num2);
     printf("%i\n", pow1);

     int fact1 = factorial(num1);
     printf("%d factorial is %i", num1, fact1);

     int num3 = 5;
     int num4 = 2;

     int negated1 = negate(num3);
     printf("The negation of %d is %i\n", num3, negated1);

     int absol3 = absolute(num3);
     printf("The absolute of %d is %i\n", num3, absol3);

     int absol2 = absolute(num4);
     printf("the absolute of %d is %i\n", num4, absol2);

     int add2 = add(num3, num4);
     printf("The addition of %d, %i, is ", num3, num4);
     printf("%i\n", add2);
     int sub2 = sub(num3, num4);
     printf("The subtraction of %d and %i is ", num3, num4);
     printf("%i\n", sub2);

     int mul2 = mul(num3, num4);
     printf("The multiplication of %d and %i is ", num3, num4);
     printf("%i\n", mul2);

     int div2 = divide(num3, num4);
     printf("The division of %d and %i is ", num3, num4);
     printf("%i\n", div2);

     int rem2 = remain(num3, num4);
     printf("The remainer of %d divided by %i is ", num3, num4);
     printf("%i\n", rem2);

     int pow2 = power(num3, num4);
     printf("%d raised the the %i is ", num3, num4);
     printf("%i\n", pow2);

     int fact2 = factorial(num3);
     printf("%d factorial is %i", num3, fact2);
     
     return 0;
}
