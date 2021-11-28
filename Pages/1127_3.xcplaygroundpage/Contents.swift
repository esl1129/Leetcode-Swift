import Foundation

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]

struct Point{
    let x:Int
    let y:Int
    init(_ x: Int, _ y: Int){
        self.x = x
        self.y = y
    }
}
func solution(_ n:Int, _ k:Int) -> [Int] {
    func check(_ xx: Int, _ yy: Int) -> Bool{
        return xx >= 0 && yy >= 0 && xx < n && yy < n
    }
    func find() -> Point{
        var max = 0
        for i in 0..<n{
            max = board[i].max()! > max ? board[i].max()! : max
        }
        for i in 0..<n{
            for j in 0..<n{
                if !visited[j][i] && board[j][i] == max { return Point(j,i)}
            }
        }
        return Point(0,0)
    }
    var board = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var point = Point(0,0)
    visited[0][0] = true
    for _ in 0..<k-1{
        var queue = [point]
        board[point.x][point.y] = 0
        var depth = 0
        while !queue.isEmpty{
            depth += 1
            for _ in 0..<queue.count{
                let currentP = queue.removeFirst()
                for dir in 0..<4{
                    let xx = currentP.x+dx[dir]
                    let yy = currentP.y+dy[dir]
                    if check(xx, yy) && board[xx][yy] >= depth{
                        board[xx][yy] = depth
                        queue.append(Point(xx,yy))
                    }
                }
            }
        }
        point = find()
        visited[point.x][point.y] = true
    }
    return [point.x+1,point.y+1]
    
}

