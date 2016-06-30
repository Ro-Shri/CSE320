#include "/user/cse320/Projects/project05.support.h"
#include <stdio.h>
#include "/user/cse320/lib/bitlib.h"

float get_infinity(){
     float infinity = 0x7f800000;
     return infinity;
}

float get_nan(){
     float nan = 0x7f800001;
     return nan;
}

float get_max_normal(){
     float max_normal =0x7f7fffff;
     return max_normal;
}

float get_min_normal(){
     float min_normal= 0x00800000;
     return min_normal;
}
float get_max_denormal(){
     float max_denorm = 0x007fffff;
     return max_denorm;
}
float get_min_denormal(){
     float min_denorm = 0x00000001;
     return min_denorm;
}

int is_negative(float num){
     union ieee_single x;
     int sign;
     x.frep = num;
     sign = x.irep >>31;
     if (sign == 0x00000000){
          return 0;
     }
     else{ 
          return 1;
     }

}
int is_infinity(float num){
     union ieee_single x;
     int biased_exp;
     int frac;
     x.frep = num;
     biased_exp = x.irep >>23;
     frac = x.irep << 9; 
     if (biased_exp == 0x7FF00000 ||biased_exp == 0xFFF00000){
          if (frac == 0x00000000){
               return 1;
          } 
     }
}
int is_nan(float num){
    union ieee_single x;
    int biased_exp;
    int frac;
    x.frep = num;
    biased_exp = x.irep >>23;
    frac = x.irep << 9;
    if (biased_exp == 0x7ff00000||biased_exp == 0xFFF00000){
         if (frac>0x00000000){
              return 1;
         }
    }
}
int is_zero(float num){
     union ieee_single x;
     int biased_exp;
     int frac;
     x.frep = num;
     biased_exp = x.irep >> 23;
     frac = x.irep << 9;
     if (biased_exp ==0x00000000 && frac== 0x00000000){
          return 1;
     }
     else{
           return 0;
     }
}
int is_denormal(float num){
     union ieee_single x;
     int biased_exp;
     int frac;
     x.frep = num;
     biased_exp = x.irep >>23;
     frac = x.irep <<9;
     if (biased_exp == 0x00000000){
          if (frac >= 0x00000001 && frac <= 0x007FFFFF){
               return 1;
          }
     }
     else{
          return 0;
     }
}
