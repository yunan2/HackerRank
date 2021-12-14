import UIKit

/*
 Given a square matrix, calculate the absolute difference between the sums of its diagonals.

 For example, the square matrix arr is shown below:

 1 2 3
 4 5 6
 9 8 9
 The left-to-right diagonal = 1 + 5 + 9 = 15. The right to left diagonal = 3 + 5 + 9. Their absolute difference is |15 - 17| = 2.

 Function description

 Complete the DiagonalDifference function in the editor below.

 diagonalDifference takes the following parameter:

 int arr[n][m]: an array of integers
 Return

 int: the absolute diagonal difference
 Input Format

 The first line contains a single integer, n, the number of rows and columns in the square matrix arr.
 Each of the next n lines describes a row, arr[i], and consists of n space-separated integers arr[i][j].

 Constraints
 -100 <= arr[i][j] <= 100
 Output Format

 Return the absolute difference between the sums of the matrix's two diagonals as a single integer.

 Sample Input

 3
 11 2 4
 4 5 6
 10 8 -12
 Sample Output

 15
 Explanation

 The primary diagonal is:

 11
    5
      -12
 Sum across the primary diagonal: 11 + 5 - 12 = 4

 The secondary diagonal is:

      4
    5
 10
 Sum across the secondary diagonal: 4 + 5 + 10 = 19
 Difference: |4 - 19| = 15


 */


/*
 * Complete the 'diagonalDifference' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var leftToRightValue = 0
    var rightToleftValue = 0
    
    for i in 0..<arr.count {
        leftToRightValue += arr[i][i]
        rightToleftValue += arr[arr.count - 1 - i][i]
    }
    return Int((rightToleftValue - leftToRightValue).magnitude)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var arr = [[Int]]()

for _ in 1...n {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == n else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == n else { fatalError("Bad input") }

let result = diagonalDifference(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
