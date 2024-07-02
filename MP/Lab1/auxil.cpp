#include "auxil.h"
#include <ctime>

namespace auxil
{
    void start()
    {
        srand((unsigned)time(NULL));
    };

    double dget(double rmin, double rmax) 
    {
        return ((double)rand() / (double)RAND_MAX) * (rmax - rmin) + rmin;
    };

    int iget(int rmin, int rmax) 
    {
        return (int)dget((double)rmin, (double)rmax);
    };

    int fibo(int number)
    {
        if (number == 0)
            return 0;

        if (number == 1)
            return 1;

        return fibo(number - 1) + fibo(number - 2);
    }
}
