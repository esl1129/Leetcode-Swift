class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans: [String] = []
        add(1,0,"(")
        func add(_ left: Int, _ right: Int, _ str: String){
            if left+right == 2*n{
                ans.append(str)
            }
            if left > right{
                add(left,right+1,str+")")
            }
            add(left+1,right,str+"(")
        }
        return ans
    }
}
