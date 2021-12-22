import UIKit

/*
 Staircase detail

 This is a staircase of size n = 4:

    #
   ##
  ###
 ####
 Its base and height are both equal to n. It is drawn using # symbols and spaces. The last line is not preceded by any spaces.

 Write a program that prints a staircase of size n.

 Function Description

 Complete the staircase function in the editor below.

 staircase has the following parameter(s):

 int n: an integer
 Print

 Print a staircase as described above.

 Input Format

 A single integer, n, denoting the size of the staircase.

 Constraints

  .

 Output Format

 Print a staircase of size n using # symbols and spaces.

 Note: The last line must have 0 spaces in it.

 Sample Input

 6
 Sample Output

      #
     ##
    ###
   ####
  #####
 ######
 Explanation

 The staircase is right-aligned, composed of # symbols and spaces, and has a height and width of n = 6.
 */

import Foundation

/*
 * Complete the 'staircase' function below.
 *
 * The function accepts INTEGER n as parameter.
 */

func staircase(n: Int) -> Void {
    // Write your code here

    for i in 0..<n {
        var str = ""
        for j in 1...n {
            if (n - i) <= j {
                str += "#"
            } else {
                str += " "
            }
        }
        print(str)
    }
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

staircase(n: n)
