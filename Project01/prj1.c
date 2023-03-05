// Name: Jackson Myers
// Student ID: 56528546
#include <stdio.h>

//prototype functions
int countNumbers(int input[], int cnt);
int increaseCount(int output[], int num);
void printResult(int output[], int cnt);

//global variables
int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
int output[] = {0, 0, 0, 0, 0, 0, 0, 0 ,0 ,0, 0, 0};
int count = 0;

//main function
int main()
{
	count = sizeof(arr)/sizeof(arr[0]);
	
	if (countNumbers(arr, count) == 0)
	{
		return 0;
	}
	printResult(output, count);
	return 0;
}

//count numbers
//count each number in the array
//assumes the numbers in the array are between
//0 and 49
//calls increaseCount in loop
int countNumbers(int input[], int cnt)
{
	int i = 0;
	while(i <= cnt)
	{
		if (increaseCount(output, input[i]) == 0)
		{
			printf("ERROR: Number outside of range\n");
			return 0;
		}
		i++;
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
	else
	{
		output[num] += 1;
		return 1;
	}
}
	
//print the result output array
//and corresponding values
void printResult(int output[], int cnt)
{
	int i;
	for (i = 0; i < cnt - 1; i++)
	{
		printf("%d : %d\n", arr[i], output[i]);
	}
}


