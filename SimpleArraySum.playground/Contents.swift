import UIKit

/*
 Given an array of integers, find the sum of its elements.

 For example, if the array ar = [1, 2, 3], 1 + 2 + 3 = 6, so return 6.

 Function Description

 Complete the simpleArraySum function in the editor below. It must return the sum of the array elements as an integer.

 simpleArraySum has the following parameter(s):

 ar: an array of integers
 Input Format

 The first line contains an integer, n, denoting the size of the array.
 The second line contains n space-separated integers representing the array's elements.

 Constraints
 0 < n, ar[i] <= 100

 Output Format

 Print the sum of the array's elements as a single integer.

 Sample Input

 6
 1 2 3 4 10 11
 Sample Output

 31
 Explanation

 We print the sum of the array's elements: 1 + 2 + 3 + 4 + 10 + 11 = 31.
 */


import Foundation

/*
 * Complete the 'simpleArraySum' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY ar as parameter.
 */

func simpleArraySum(ar: [Int]) -> Int {
    // Write your code here
    return ar.reduce(0, +)
}

// for 문으로 합산 하기
//func simpleArraySum(ar: [Int]) -> Int {
//    // Write your code here
//    var sum  = 0
//    for i in ar {
//        sum += i
//    }
//
//    return sum
//}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == arCount else { fatalError("Bad input") }

let result = simpleArraySum(ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
