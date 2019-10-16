

import UIKit

//Q1-Write fibonacci series using recursion

func fibonacciRecursiveNum1(num1: Int, num2: Int, steps: Int) {
    
    if num1 == 0 {
        print("1,")
    }
    
    if steps > 0 {
        let newNum = num1 + num2
        print(",\(newNum)")
        fibonacciRecursiveNum1(num1: num2, num2: newNum, steps: steps-1)
    }
}
fibonacciRecursiveNum1(num1: 0, num2: 1, steps: 7)


//Q2-Write a program that writes 3 when 5 is input and 5 when 3 is input without using any sort of condition logic

func get(_ n: Int) -> Int {

    return 3 + (5 % n)
}

print("\(get(5))")
