import UIKit

/*
 
 In this challenge, you are required to calculate and print the sum of the elements in an array, keeping in mind that some of those integers may be quite large.

 Function Description

 Complete the aVeryBigSum function in the editor below. It must return the sum of all array elements.

 aVeryBigSum has the following parameter(s):

 int ar[n]: an array of integers .
 Return

 long: the sum of all array elements
 Input Format

 The first line of the input consists of an integer n.
 The next line contains n space-separated integers contained in the array.

 Output Format

 Return the integer sum of the elements in the array.

 Constraints
 1 <= n <= 10
 0 <= ar[i] <= 10¹⁰

 Sample Input

 5
 1000000001 1000000002 1000000003 1000000004 1000000005
 Output

 5000000015
 Note:

 The range of the 32-bit integer is .
 When we add several integer values, the resulting sum might exceed the above range. You might need to use long int C/C++/Java to store such sums.
 */

/*
 * Complete the 'aVeryBigSum' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts LONG_INTEGER_ARRAY ar as parameter.
 */

func aVeryBigSum(ar: [Int]) -> Int {
    // Write your code here
    
    // 방법1
    // var sum = 0
    
    // for value in ar {
    //     sum += value
    // }
    
    // 방법2
    let sum = ar.reduce(0){$0 + $1}
    // ar.reduce(0, +)
    return sum
}

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

let result = aVeryBigSum(ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
