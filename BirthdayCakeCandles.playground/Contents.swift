import UIKit

/*
 You are in charge of the cake for a child's birthday. You have decided the cake will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Count how many candles are tallest.

 Example
 candles = [4, 4, 1, 3]
 
 The maximum height candles are 4 units high. There are 2 of them, so return 2.

 Function Description

 Complete the function birthdayCakeCandles in the editor below.

 birthdayCakeCandles has the following parameter(s):

 int candles[n]: the candle heights
 Returns

 int: the number of candles that are tallest
 Input Format

 The first line contains a single integer, n, the size of candles[].
 The second line contains n space-separated integers, where each integer i describes the height of candles[i].

 Constraints
 1 <= n <= 10⁵
 1 <= candles[i] <= 10⁷
 
 
 Sample Input 0

 4
 3 2 1 3
 Sample Output 0

 2
 Explanation 0

 Candle heights are [3, 2, 1, 3]. The tallest candles are 3 units, and there are 2 of them.
 */

import Foundation

/*
 * Complete the 'birthdayCakeCandles' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY candles as parameter.
 */

func birthdayCakeCandles(candles: [Int]) -> Int {
    // Write your code here
    let maxInt = candles.max()
    return candles.filter{$0 == maxInt}.count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let candlesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let candlesTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let candles: [Int] = candlesTemp.split(separator: " ").map {
    if let candlesItem = Int($0) {
        return candlesItem
    } else { fatalError("Bad input") }
}

guard candles.count == candlesCount else { fatalError("Bad input") }

let result = birthdayCakeCandles(candles: candles)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
