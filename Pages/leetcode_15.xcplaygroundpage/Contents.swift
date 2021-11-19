class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var answer: [[Int]] = []
        var newnums = Array(Set(nums)).sorted{$0 < $1}
        if newnums.count < 3{
            return []
        }
        
        for i in 0..<newnums.count-2{
            for j in i+1..<newnums.count-1{
                for k in j+1..<newnums.count{
                    if newnums[i]+newnums[j]+newnums[k] == 0{
                        answer.append([newnums[i],newnums[j],newnums[k]])
                    }
                }
            }
        }
        
        return answer
    }
}
