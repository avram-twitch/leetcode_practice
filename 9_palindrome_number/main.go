/*
Given an integer x, return true if x is a
palindrome
, and false otherwise.

 

Example 1:

Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.

Example 2:

Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

Example 3:

Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
*/

package main

import (
    "fmt"
    "strconv"
)

func palindrome(x int) bool {
    xString := strconv.Itoa(x)

    for i, j := 0, len(xString) - 1; i < j; i, j = i + 1, j - 1 {
        if xString[i] != xString[j] {
            return false
        }
    }

    return true
}

func main() {
    testInputs := []int {121, -121, 10}

    for _, x := range testInputs {
        fmt.Printf("%d => %t\n", x, palindrome(x))
    }

}
