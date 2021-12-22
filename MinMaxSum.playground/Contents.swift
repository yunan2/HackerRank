import UIKit

/*
 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

 Example
 arr = [1, 3, 5, 7, 9]
 The minimum sum is 1 + 3 + 5 + 7 = 16 and the maximum sum is 3 + 5 + 7 + 9 = 24. The function prints

 16 24
 Function Description

 Complete the miniMaxSum function in the editor below.

 miniMaxSum has the following parameter(s):

 arr: an array of 5 integers
 Print

 Print two space-separated integers on one line: the minimum sum and the maximum sum of 4 of 5 elements.

 Input Format

 A single line of five space-separated integers.

 Constraints
 1 <= arr[i] <= 10⁹

 Output Format

 Print two space-separated long integers denoting the respective minimum and maximum values that can be calculated by summing exactly four of the five integers. (The output can be greater than a 32 bit integer.)

 Sample Input

 1 2 3 4 5
 Sample Output

 10 14
 Explanation

 The numbers are 1, 2, 3, 4, and 5. Calculate the following sums using four of the five integers:

 Sum everything except 1, the sum is 2 + 3 + 4 + 5 = 14.
 Sum everything except 2, the sum is 1 + 3 + 4 + 5 = 13.
 Sum everything except 3, the sum is 1 + 2 + 4 + 5 = 12.
 Sum everything except 4, the sum is 1 + 2 + 3 + 5 = 11.
 Sum everything except 5, the sum is 1 + 2 + 3 + 4 = 10.
 Hints: Beware of integer overflow! Use 64-bit Integer.

 Need help to get started? Try the Solve Me First problem
 */

import Foundation

/*
 * Complete the 'miniMaxSum' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here

//    var minSum = 0
//    var maxSum = 0
    
    // for i in arr {
    //     if i != arr.max() {
    //         minSum += i
    //     }
    //     if i != arr.min() {
    //         maxSum += i
    //     }
    // }
    
    // 위와 같이 했을 경우 [5, 5, 5, 5, 5] 같이 모두 같은 숫자가 담긴 배열에서 오류가 발생함.
    
    var minArr = arr
    minArr.sort(by: <)
    minArr.removeLast()
    
    var maxArr = arr
    maxArr.sort(by: >)
    maxArr.removeLast()
    
    print("\(minArr.reduce(0, +)) \(maxArr.reduce(0, +))")
}

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == 5 else { fatalError("Bad input") }

miniMaxSum(arr: arr)
