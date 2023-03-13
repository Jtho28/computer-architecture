// Name: Jackson Myers
// Student ID: 56528546
#include <stdio.h>

//prototype functions
int countNumbers(int input[], int cnt);
int increaseCount(int output[], int num);
void printResult(int output[], int cnt);

//global variables
int arr[] = {10, 2, 1, 1, 10, 10, 6, 40, 40, 40, 49};
int count = sizeof(arr)/sizeof(arr[0]);
int output[50] = {0};
int outputsize = sizeof(output)/sizeof(output[0]);


//main function
int main()
{
	
	if (countNumbers(arr, count) == 0)
	{
		return 0;
	}
	printResult(output, outputsize);
	return 0;
}

//count numbers
//count each number in the array
//assumes the numbers in the array are between
//0 and 49
//calls increaseCount in loop
int countNumbers(int input[], int cnt)
{
	int i;
	int num = -1;
	for(i = 0; i <= cnt - 1; i++)
	{
		num = input[i];
		if (increaseCount(output, num) == 0)
		{
			printf("Error: invalid number %d\n", num);
			return 0;
		}
	}
	
	return 1;
	
}

//Increase the output[num]
int increaseCount(int output[], int num)
{
	if (num < 0 || num > 49)
	{
		return 0;
	}
	output[num] += 1;
	return 1;

}
	
//print the result output array
//and corresponding values
void printResult(int output[], int cnt)
{
	int i;
	printf("Result:\n");
	for (i = 0; i < 50; i++)
	{
		if (output[i] > 0)
		{
			printf("%d : %d\n", i, output[i]);
		}
	}
}


