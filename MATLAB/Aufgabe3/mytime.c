#include <time.h>

unsigned int my_time()
{
    struct timespec ts;

    if (clock_gettime (CLOCK_MONOTONIC, &ts) == 0)
        return (unsigned int) (ts.tv_sec * 1000 + ts.tv_nsec / 1000000);
    else
        return 0;
}

