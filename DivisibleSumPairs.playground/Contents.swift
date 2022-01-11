import UIKit

/*
 Given an array of integers and a positive integer k, determine the number of (i, j) pairs where i < j and  ar[i] + ar[j] is divisible by k.

 Example
 ar = [1, 2, 3, 4, 5, 6]
 k = 5


 Three pairs meet the criteria: [1, 4], [2, 3] and [4, 6].

 Function Description

 Complete the divisibleSumPairs function in the editor below.

 divisibleSumPairs has the following parameter(s):

 int n: the length of array ar
 int ar[n]: an array of integers
 int k: the integer divisor
 Returns
 - int: the number of pairs

 Input Format

 The first line contains 2 space-separated integers, n and k.
 The second line contains n space-separated integers, each a value of arr[i].

 Constraints
 2 <= n <= 100
 1 <= k <= 100
 1 <= ar[i] <= 100
 
 Sample Input

 STDIN           Function
 -----           --------
 6 3             n = 6, k = 3
 1 3 2 6 1 2     ar = [1, 3, 2, 6, 1, 2]
 Sample Output

  5
 Explanation

 Here are the 5 valid pairs when k = 3:
 (0, 2) -> ar[0] + ar[2] = 1 + 2 = 3
 (0, 5) -> ar[0] + ar[5] = 1 + 2 = 3
 (1, 3) -> ar[1] + ar[3] = 3 + 6 = 9
 (2, 4) -> ar[2] + ar[4] = 2 + 1 = 3
 (4, 5) -> ar[4] + ar[5] = 1 + 2 = 3

 */


import Foundation

/*
 * Complete the 'divisibleSumPairs' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER k
 *  3. INTEGER_ARRAY ar
 */

func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    // Write your code here
    var count = 0
    for i in 0 ..< n {
        for j in i + 1 ..< n {
            if (ar[i] + ar[j]) % k == 0 {
                count += 1
            }
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let k = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let arTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = divisibleSumPairs(n: n, k: k, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

