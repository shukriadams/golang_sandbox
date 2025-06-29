package main

import (
	"fmt"
)

func add(x int, y int) (int, int, int) {
	return x, y, x + y
}

func main(){
	a,b,c := add(10,20)
	fmt.Println(a,b,c)
}
