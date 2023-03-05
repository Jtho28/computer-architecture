#include <stdio.h>

// function prototypes
int increaseCnt(int output[], int num);
void printResult(int output[], int cnt);
void countNumbers(int input[], int cnt);

// main function
int main()
{
    int input[] = {10, 2, 1, 1, 3, 10, 49};
    int cnt = sizeof(input) / sizeof(int);
    countNumbers(input, cnt);
    return 0;
}

// function to count numbers
void countNumbers(int input[], int cnt)
{
    int output[50] = {0}; // initialize all elements to 0
    for (int i = 0; i < cnt; i++)
    {
        int num = input[i];
        if (increaseCnt(output, num) == 0)
        {
            printf("Error: invalid number %d\n", num);
            return; // terminate the program
        }
    }
    printResult(output, cnt);
}

// function to increase count of a number
int increaseCnt(int output[], int num)
{
    if (num < 0 || num > 49)
    {
        return 0; // invalid range
    }
    output[num] += 1;
    return 1;
}

// function to print the results
void printResult(int output[], int cnt)
{
    printf("Result:\n");
    for (int i = 0; i < 50; i++)
    {
        if (output[i] > 0)
        {
            printf("%d: %d\n", i, output[i]);
        }
    }
}
