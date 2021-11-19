class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var newArr = (nums1+nums2).sorted{$0 < $1}
        let size = newArr.count
        if size % 2 == 1 { return Double(newArr[size/2]) }
        return Double(newArr[size/2-1]+newArr[size/2])/2
        
    }
}
