class Solution {
    func trap(_ height: [Int]) -> Int {
        let max = height.max()!
        let mid = Int(height.firstIndex(of: max)!)
        var ans = 0
        var current = 0
        for i in 0..<mid{
            if current < height[i]{
                current = height[i]
                continue
            }
            ans += current-height[i]
        }
        current = 0
        for i in stride(from: height.count-1, to: mid, by: -1){
            if current < height[i]{
                current = height[i]
                continue
            }
            ans += current-height[i]
        }
        return ans
    }
}
