#include "fact.h"


int fact(int n){
  if (n==0) return 1;
  if (n==1) return 1;
  return fact(n-1)*n;
}