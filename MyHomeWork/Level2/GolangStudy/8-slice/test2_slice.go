package main

import "fmt"

// 动态数组在传参上是引用传递, 而且不同元素的动态数组他们的形参是一致的
func printArray(myArray []int) {
	//引用传递
	// _ 表示匿名的变量
	for _, value := range myArray {
		fmt.Println("value = ", value)
	}

	myArray[0] = 100
}

func main() {
	myArray := []int{1, 2, 3, 4} // 动态数组，切片 slice

	fmt.Printf("myArray type is %T\n", myArray)

	printArray(myArray)

	fmt.Println(" ==== ")

	for _, value := range myArray {
		fmt.Println("value = ", value)
	}
}
