#pragma once 
#include "Subset.h"

int knapsack_s(
    int V,         // [in]  ����������� ������� 
    short n,       // [in]  ���������� ����� ��������� 
    const int v[], // [in]  ������ �������� ������� ����  
    const int c[], // [in]  ��������� �������� ������� ����     
    short m[]      // [out] ���������� ��������� 
);