class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let a = String(x)
        if a == String(a.reversed()){
            return true
        }
        return false
    }
}
