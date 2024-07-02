#include <iostream>

#include "Auxil.h"

#define CYCLE 36

int main()

{

	double av1 = 0, av2 = 0;
	clock_t t1 = 0, t2 = 0;
	setlocale(LC_ALL, "rus");

	/*auxil::start();
	t1 = clock();
	for (int i = 0; i < CYCLE; i++)
	{
		av1 += (double)auxil::iget(-100, 100);
		av2 += auxil::dget(-100, 100);
	}
	t2 = clock();


	std::cout << std::endl << "���������� ������:         " << CYCLE;
	std::cout << std::endl << "������� �������� (int):    " << av1 / CYCLE;
	std::cout << std::endl << "������� �������� (double): " << av2 / CYCLE;
	std::cout << std::endl << "����������������� (�.�):   " << (t2 - t1);
	std::cout << std::endl << "                  (���):   "
		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);
	std::cout << std::endl;*/


	auxil::start();

	t1 = clock();

	for (int i = 1; i < CYCLE; i++)

	{

		auxil::fibo(i);

	}

	t2 = clock(); 

	std::cout << std::endl << "���������� ������: " << CYCLE;
	std::cout << std::endl << "����������������� (�.�): " << (t2 - t1);
	std::cout << std::endl << " (���): "

		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);

	std::cout << std::endl;


	system("pause");

	return 0;

}
