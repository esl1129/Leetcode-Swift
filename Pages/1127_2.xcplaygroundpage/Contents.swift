import Foundation

func solution(_ arr:[Int]) -> Int {
    let size = arr.count
    var ans = 0
    var up = 0
    var down = 0
    for i in 0..<size-1{
        if arr[i+1] > arr[i]{
            if down != 0{
                ans += up*down
                up = 0
                down = 0
            }
            up += 1
        }else if arr[i+1] < arr[i]{
            down += 1
        }else{
            ans += up*down
            up = 0
            down = 0
        }
    }
    ans += up*down
    return ans
}
