#include <iostream>
#include <iomanip>
#include "Subset.h"
#include "Combination.h"
#include "Permutation.h"
#include "Accomodation.h"
#include "Knapsack.h"

#define N (sizeof(AA)/2)
#define M 3

int main() {
    setlocale(LC_ALL, "rus");

    //-----------------------------------------------------------------

    char  AA1[][2] = { "A", "B", "C", "D" };
    std::cout << std::endl << " - Генератор множества всех подмножеств -";
    std::cout << std::endl << "Исходное множество: ";
    std::cout << "{ ";
    for (int i = 0; i < sizeof(AA1) / 2; i++)
        std::cout << AA1[i] << ((i < sizeof(AA1) / 2 - 1) ? ", " : " ");
    std::cout << "}";
    std::cout << std::endl << "Генерация всех подмножеств  ";
    combi::subset s1(sizeof(AA1) / 2);         // создание генератора   
    int  n1 = s1.getfirst();                // первое (пустое) подмножество    
    while (n1 >= 0)                          // пока есть подмножества 
    {
        std::cout << std::endl << "{ ";
        for (int i = 0; i < n1; i++)
            std::cout << AA1[s1.ntx(i)] << ((i < n1 - 1) ? ", " : " ");
        std::cout << "}";
        n1 = s1.getnext();                   // cледующее подмножество 
    };
    std::cout << std::endl << "всего: " << s1.count() << std::endl;

    //----------------------------------------------------------------

    char  AA2[][2] = { "A", "B", "C", "D", "E" };
    std::cout << std::endl << " --- Генератор сочетаний ---";
    std::cout << std::endl << "Исходное множество: ";
    std::cout << "{ ";
    for (int i = 0; i < sizeof(AA2) / 2; i++)

        std::cout << AA2[i] << ((i < sizeof(AA2) / 2 - 1) ? ", " : " ");
    std::cout << "}";
    std::cout << std::endl << "Генерация сочетаний ";
    combi::xcombination xc(sizeof(AA2) / 2, 3);
    std::cout << "из " << xc.n << " по " << xc.m;
    int  n2 = xc.getfirst();
    while (n2 >= 0)
    {

        std::cout << std::endl << xc.nc << ": { ";

        for (int i = 0; i < n2; i++)

            std::cout << AA2[xc.ntx(i)] << ((i < n2 - 1) ? ", " : " ");

        std::cout << "}";

        n2 = xc.getnext();
    };
    std::cout << std::endl << "всего: " << xc.count() << std::endl;

    //------------------------------------------------------------------

    char AA3[][2] = { "A", "B", "C", "D" };
    std::cout << std::endl << " --- Генератор перестановок ---";
    std::cout << std::endl << "Исходное множество: ";
    std::cout << "{ ";
    for (int i = 0; i < sizeof(AA3) / 2; i++)

        std::cout << AA3[i] << ((i < sizeof(AA3) / 2 - 1) ? ", " : " ");
    std::cout << "}";
    std::cout << std::endl << "Генерация перестановок ";
    combi::permutation p(sizeof(AA3) / 2);
    __int64  n3 = p.getfirst();
    while (n3 >= 0)
    {
        std::cout << std::endl << std::setw(4) << p.np << ": { ";

        for (int i = 0; i < p.n; i++)

            std::cout << AA3[p.ntx(i)] << ((i < p.n - 1) ? ", " : " ");

        std::cout << "}";

        n3 = p.getnext();
    };
    std::cout << std::endl << "всего: " << p.count() << std::endl;
 

    //-------------------------------------------------------------------------

    char AA[][2] = { "A", "B", "C", "D" };
    std::cout << std::endl << " --- Генератор размещений ---";
    std::cout << std::endl << "Исходное множество: ";
    std::cout << "{ ";
    for (int i = 0; i < N; i++)

        std::cout << AA[i] << ((i < N - 1) ? ", " : " ");
    std::cout << "}";
    std::cout << std::endl << "Генерация размещений  из  " << N << " по " << M;
    combi::accomodation s(N, M);
    int  n = s.getfirst();
    while (n >= 0)
    {

        std::cout << std::endl << std::setw(2) << s.na << ": { ";

        for (int i = 0; i < 3; i++)

            std::cout << AA[s.ntx(i)] << ((i < n - 1) ? ", " : " ");

        std::cout << "}";

        n = s.getnext();
    };
    std::cout << std::endl << "всего: " << s.count() << std::endl << std::endl;


    //-------------------------------------------------------------------------

    const int length = 20;
    int weights[length];
    int prices[length];
    short out[length];

    srand(time(NULL));

    for (int i = 0; i < length; i++) {
        weights[i] = (double)(rand() / (double)RAND_MAX) * (300 - 10) + 10;
        prices[i] = (double)(rand() / (double)RAND_MAX) * (55 - 5) + 5;
    }

    for (auto w : weights) {
        std::cout << std::setw(4) << w << " ";
    }
    std::cout << std::endl;
    for (auto p : prices) {
        std::cout << std::setw(4) << p << " ";
    }
    std::cout << std::endl;

    time_t t1 = clock();
    knapsack_s(300, length, weights, prices, out);
    time_t t2 = clock();

    for (auto a : out) {
        std::cout << std::setw(4) << a << " ";
    }
    std::cout << std::endl;
    std::cout << t2 - t1 << std::endl;
}
