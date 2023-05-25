#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

unsigned long long factorial = 1;

void *computeFactorial(void *arg) {
  unsigned int *number = (unsigned int *)arg;
  unsigned int n = *number;

  if (n == 0 || n == 1) {
	factorial = 1;
  } else {
	pthread_t thread;
	unsigned int nextNumber = n - 1;
	pthread_create(&thread, NULL, computeFactorial, &nextNumber);
	void *result;
	pthread_join(thread, &result);
	factorial = nextNumber * factorial;
  }
  printf("Factorial of %u is: %llu\n", n, factorial);
  pthread_exit(NULL);
}


int main() {
  unsigned int number;

  printf("Enter a number: ");
  scanf("%u", &number);

  pthread_t thread;
  pthread_create(&thread, NULL, computeFactorial, &number);
  pthread_join(thread, NULL);

  return 0;
}