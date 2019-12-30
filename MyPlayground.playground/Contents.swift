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
