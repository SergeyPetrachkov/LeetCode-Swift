/** Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
 */
class Solution {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
      for j in i+1..<nums.count {
        let sum = nums[i] + nums[j]
        if sum == target {
          return [i, j]
        }
      }
    }
    return []
  }
}

Solution().twoSum([2, 7, 11, 15], 13)

/**
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

func reverse(_ x: Int) -> Int {
  if x == 0 {
    return 0
  }
  let stringified = "\(x)"
  if let sign = stringified.first, sign == "-" || sign == "0" {
    var reversedInt = Int32(String(stringified.dropFirst().reversed())) ?? 0
    if sign == "-" {
      reversedInt.negate()
    }
    return Int(reversedInt)
  } else {
    let reversed = String(stringified.reversed())
    return Int(Int32(reversed) ?? 0)
  }
}
reverse(1534236469)


