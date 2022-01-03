import UIKit

/*
 HackerLand University has the following grading policy:

 Every student receives a grade in the inclusive range from 0 to 100.
 Any grade less than 40 is a failing grade.
 Sam is a professor at the university and likes to round each student's grade according to these rules:

 If the difference between the grade and the next multiple of 5 is less than 3, round grade up to the next multiple of 5.
 If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
 Examples

  grade = 84 round to 85 (85 - 84 is less than 3)
  grade = 29 do not round (result is less than 40)
  grade = 57 do not round (60 - 57 is 3 or higher)
 Given the initial value of grade for each of Sam's n students, write code to automate the rounding process.

 Function Description

 Complete the function gradingStudents in the editor below.

 gradingStudents has the following parameter(s):

 int grades[n]: the grades before rounding
 Returns

 int[n]: the grades after rounding as appropriate
 Input Format

 The first line contains a single integer, n, the number of students.
 Each line i of the n subsequent lines contains a single integer, grades[i].

 Constraints
 1 <= n <= 60
 0 <= grade[i] <= 100
 
 Sample Input 0

 4
 73
 67
 38
 33
 Sample Output 0

 75
 67
 40
 33
 Explanation 0

 image

 Student 1 received a 73, and the next multiple of 5 from 73 is 75. Since 75 - 73 < 3, the student's grade is rounded to 75.
 Student 2 received a 67, and the next multiple of 5 from 67 is 70. Since 70 - 67 = 3, the grade will not be modified and the student's final grade is 67.
 Student 3 received a 38, and the next multiple of 5 from 38 is 40. Since 40 - 38 < 3, the student's grade will be rounded to 40.
 Student 4 received a grade below 33, so the grade will not be modified and the student's final grade is 33.
 */

import Foundation

/*
 * Complete the 'gradingStudents' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY grades as parameter.
 */

func gradingStudents(grades: [Int]) -> [Int] {
    // Write your code here

    var resultArr: [Int] = []

    for point in grades {
        if point < 38 {
            resultArr.append(point)
            continue
        }
        
        let backwardValue = point % 10
        if backwardValue < 5 {
            if 5 - backwardValue < 3 {
                resultArr.append(point + (5 - backwardValue))
            } else {
                resultArr.append(point)
            }
        } else if backwardValue > 5 {
            if 10 - backwardValue < 3 {
                resultArr.append(point + (10 - backwardValue))
            } else {
                resultArr.append(point)
            }
        } else {
            resultArr.append(point)
        }
    }
    
    return resultArr
}

// 더 좋은 답
/*
 func gradingStudents(grades: [Int]) -> [Int] {
     // Write your code here

     var resultArr: [Int] = []

     for point in grades {
         let backwardValue = point % 5
         if point > 37 && 5 - backwardValue < 3 {
              resultArr.append(point + (5 - backwardValue))
          } else {
             resultArr.append(point)
         }
     }
     
     return resultArr
 }
 */

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let gradesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var grades = [Int]()

for _ in 1...gradesCount {
    guard let gradesItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    grades.append(gradesItem)
}

guard grades.count == gradesCount else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
