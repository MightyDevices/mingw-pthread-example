/*
 * pthread_test.c
 *
 *  Created on: 06.04.2019
 *      Author: Tomek
 */

#include <stdio.h>
#include <getopt.h>
#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>

/* function to be run in thread */
void * thread_func(void *arg)
{
    /* extract the number from thread function argument */
    int number = *((int *)arg);
    /* we allocate so that this variable stays after the thread is gone */
    int *factorial = malloc(sizeof(int));
    /* initialize value */
    *factorial = 1;

    /* increment counter */
    for (int i = 1; i <= number; i++) {
        /* compute the factorial value */
        *factorial *= i;
        /* show the current count value */
        printf("i = %d, factorial = %d\n", i, *factorial);
        /* make sure that we print something on the command line */
        fflush(stdout);
        /* sleep for one second */
        sleep(1);
    }

    /* return pointer to computation result */
    return factorial;
}

/* main program entry */
int main(int argc, char *argv[])
{
    /* this variable is our reference to the second thread */
    pthread_t thread;

    /* number that we wish to compute the factorial of */
    int number = 10, *factorial;
    /* create the thread */
    pthread_create(&thread, NULL, thread_func, &number);
    /* wait fot the thread to finish*/
    pthread_join(thread, (void **)&factorial);

    /* show the result */
    printf("done!, final result = %d\n", *factorial);
    /* free the memory */
    free(factorial);
    /* report status */
    return 0;
}
