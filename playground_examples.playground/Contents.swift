

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
//Time Complexity: O(2^n)
//Space Complexity: O(2^n)

func fib(_ n: Int) -> Int {
    var M = [[1, 1], [1, 0]]
    guard n > 2 else { return n }
    power(&M, n)
    return M[0][0]
}
func power(_ matrix: inout [[Int]], _ n: Int) {
    guard n > 1 else { return }
    power(&matrix, n/2)
    matrix = multiply(matrix, matrix)
    if n % 2 != 0 {
        let M = [[1, 1], [1, 0]]
        matrix = multiply(matrix, M)
    }
}
fib(7)
//Time Complexity: O(log n)
//Space Complexity: O(log n) , because of recursion stack

//Q2-Write a program that writes 3 when 5 is input and 5 when 3 is input without using any sort of condition logic

func get(_ n: Int) -> Int {

    return 3 + (5 % n)
}

print("\(get(5))")


//Q3-balancing the brackets problem
import Foundation

func isBalanced(sequence: String) -> Bool {
    var stack = ""
    for bracket in sequence {
        switch bracket {
            case "{", "[", "(":
            stack.append(bracket)
            case "}", "]", ")":
            if stack.isEmpty
            || (bracket == "}" && stack.last != "{")
            || (bracket == "]" && stack.last != "[")
            || (bracket == ")" && stack.last != "(") {
                return false
            }
            stack.removeLast()
            default:
            fatalError("unknown bracket found")
        }
    }
    return stack.isEmpty
}

func braces(values: [String]) -> [String] {
    var resultArray = [String]()
    for i in 0...(values.count - 1) {
        resultArray.append(isBalanced(sequence: values[i] ) ? "YES" : "NO")
    }

    return resultArray
}

print("\(braces(values: "({[]})"))")

//Find smallest positive integer
//
//public func find_solution(_ Array : inout [Int]) -> Int
//
//given an array Array of N integers, returns the smallest positive integer (> than 0) that does not occur in A.
//
//For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
//
//Given A = [1, 2, 3], the function should return 4.
//
//Given A = [−1, −3], the function should return 1.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//each element of array A is an integer within the range [−1,000,000..1,000,000].

import UIKit

public func solution(_ A : inout [Int]) -> Int {
    let distinctArray = Array(Set(A)).sorted(by: { $0 < $1 })
    var min = 1
    
    for i in (0...distinctArray.count - 1) {
        if distinctArray[i] > 0 {
             if i + 1 <= (distinctArray.count - 1), distinctArray[i] !=  distinctArray[i + 1] - 1 {
                     return  distinctArray[i] + 1
                 } else {
                    min =  distinctArray[(distinctArray.count - 1)] + 1
            }
        }
    }
    return min
}

var A =  [1, 3, 6, 4, 1, 2]
solution(&A)
 A = [1, 2, 3]
solution(&A)
 A = [-1, -3]
solution(&A)

