class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums)).sorted{$0 < $1}
        return nums.count
    }
}
