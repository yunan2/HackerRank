import UIKit

/*
 Two children, Lily and Ron, want to share a chocolate bar. Each of the squares has an integer on it.

 Lily decides to share a contiguous segment of the bar selected such that:

 The length of the segment matches Ron's birth month, and,
 The sum of the integers on the squares is equal to his birth day.
 Determine how many ways she can divide the chocolate.

 Example
 s = [2, 2, 1, 3, 2]
 d = 4
 m = 2

 Lily wants to find segments summing to Ron's birth day, d = 4 with a length equalling his birth month, m = 2. In this case, there are two segments meeting her criteria: [2, 2] and [1, 3].

 Function Description

 Complete the birthday function in the editor below.

 birthday has the following parameter(s):

 int s[n]: the numbers on each of the squares of chocolate
 int d: Ron's birth day
 int m: Ron's birth month
 Returns

 int: the number of ways the bar can be divided
 Input Format

 The first line contains an integer n, the number of squares in the chocolate bar.
 The second line contains  space-separated integers s[i], the numbers on the chocolate squares where 0 <= i < n.
 The third line contains two space-separated integers, d and m, Ron's birth day and his birth month.

 Constraints
 1 <= n <= 100
 1 <= s[i] <= 5, where(0 <= i < n)
 1 <= d <= 31
 1 <= m <= 12
 
 , where ()
 Sample Input 0

 5
 1 2 1 3 2
 3 2
 Sample Output 0

 2
 Explanation 0

 Lily wants to give Ron m = 2 squares summing to d = 3. The following two segments meet the criteria:

 image

 Sample Input 1

 6
 1 1 1 1 1 1
 3 2
 Sample Output 1

 0
 Explanation 1

 Lily only wants to give Ron m = 2 consecutive squares of chocolate whose integers sum to d = 3. There are no possible pieces satisfying these constraints:

 image

 Thus, we print o as our answer.

 Sample Input 2

 1
 4
 4 1
 Sample Output 2

 1
 Explanation 2

 Lily only wants to give Ron m = 1 square of chocolate with an integer value of d = 4. Because the only square of chocolate in the bar satisfies this constraint, we print 1 as our answer.
 */

import Foundation

/*
 * Complete the 'birthday' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY s
 *  2. INTEGER d
 *  3. INTEGER m
 */

func birthday(s: [Int], d: Int, m: Int) -> Int {
    // Write your code here
    var count = 0
    for i in 0 ... s.count - m {
        var sum = 0
        for j in i ..< i + m {
            sum += s[j]
        }
        
        if sum == d {
            count += 1
        }
    }
    
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let sTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let s: [Int] = sTemp.split(separator: " ").map {
    if let sItem = Int($0) {
        return sItem
    } else { fatalError("Bad input") }
}

guard s.count == n else { fatalError("Bad input") }

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let d = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

let result = birthday(s: s, d: d, m: m)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
