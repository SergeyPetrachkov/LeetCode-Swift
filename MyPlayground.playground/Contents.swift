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

//Solution().twoSum([2, 7, 11, 15], 13)

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
//reverse(1534236469)


func isPalindrome(_ x: Int) -> Bool {
  if x<0 || (x % 10 == 0 && x != 0) { // negatives are not palindromes and X mod 10 = 0 --> not a palindrome
    return false
  }
  var reverted = 0
  var xCopy = x
  while x > reverted {
    reverted = (reverted * 10) + (xCopy % 10)
    xCopy /= 10
  }
  return reverted == x || x == reverted/10
}

//isPalindrome(121)

class RomanSolution {
  enum Roman: String {
    case I
    case V
    case X
    case L
    case C
    case D
    case M
    
    var intValue: Int {
      switch self {
      case .I:
        return 1
      case .V:
        return 5
      case .X:
        return 10
      case .L:
        return 50
      case .C:
        return 100
      case .D:
        return 500
      case .M:
        return 1000
      }
    }
    
    static func + (lhs: Roman, rhs: Roman) -> Int {
      return lhs.intValue + rhs.intValue
    }
    
    static func - (lhs: Roman, rhs: Roman) -> Int {
      return lhs.intValue - rhs.intValue
    }
  }
  
  
  func romanToInt(_ s: String) -> Int {
    var result: Int = 0
    
    let components = s.compactMap { String($0) }
    
    var index: Int = 0
    
    while index < components.count {
      if let currentRoman = Roman(rawValue: components[index]) {
        switch currentRoman {
        case .I:
          if index == components.count - 2,
            let last = components.last,
            let nextRoman = Roman(rawValue: last),
            (nextRoman == .V || nextRoman == .X) {
            result += (nextRoman - currentRoman)
            index += 1
          } else {
            result += currentRoman.intValue
          }
        case .X:
          if index+1 < components.count,
            let nextRoman = Roman(rawValue: components[index+1]),
            (nextRoman == .L || nextRoman == .C) {
            result += (nextRoman - currentRoman)
            index += 1
          } else {
            result += currentRoman.intValue
          }
        case .V, .L, .D, .M:
          result += currentRoman.intValue
        case .C:
          if index+1 < components.count,
            let nextRoman = Roman(rawValue: components[index+1]),
            (nextRoman == .D || nextRoman == .M) {
            result += (nextRoman - currentRoman)
            index += 1
          } else {
            result += currentRoman.intValue
          }
        }
        index += 1
      }
    }
    
    return result
  }
}
 RomanSolution().romanToInt("MCMXCIV")
