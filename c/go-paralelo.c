//gcc -fopenmp -o go go.c
//./go
//Rafael Guimaraes - 19.4.19
//Exemplo: https://www.gribblelab.org/CBootCamp/A2_Parallel_Programming_in_C.html#orgbd1710b


#include <stdio.h>
#include <omp.h>

int main(int argc, char **argv)
{
  int i, thread_id, nloops;

#pragma omp parallel private(thread_id, nloops)
  {
    nloops = 0;

#pragma omp for
    for (i=0; i<1000000000; ++i)
      {
        ++nloops;
	//printf("\nThread: %d \t i: %d",thread_id,i);
      }

    thread_id = omp_get_thread_num();

    printf("Thread %d performed %d iterations of the loop.\n",
           thread_id, nloops );
  }

  return 0;
}
