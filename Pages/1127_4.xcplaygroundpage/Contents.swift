import Foundation

struct Rect{
    var index: Int
    var xmin: Int
    var ymin: Int
    var xmax: Int
    var ymax: Int
    
    init(_ index: Int, _ xmin:Int, _ ymin: Int, _ xmax: Int, _ ymax: Int){
        self.index = index
        self.xmin = xmin
        self.ymin = ymin
        self.xmax = xmax
        self.ymax = ymax
    }
}

func solution(_ rectangles:[[Int]]) -> [String] {
    var xCoord = [Int](repeating: 0, count: 1000001)
    var yCoord = [Int](repeating: 0, count: 1000001)

    // O(200,000)
    var rectArr = [Rect]()
    for (index,rect) in rectangles.enumerated(){
        rectArr.append(Rect(index, rect[0], rect[1], rect[2], rect[3]))
    }
    
    
    var newRectArr1 = [Rect]()
    
    // O(200,000)
    for rec in rectArr.sorted{$0.ymin < $1.ymin}{
        let m = yCoord[rec.xmin+1...rec.xmax].max()!
        newRectArr1.append(Rect(rec.index, rec.xmin, m, rec.xmax, rec.ymax-rec.ymin+m))
        for i in rec.xmin+1...rec.xmax{ // O(20)
            yCoord[i] = rec.ymax-rec.ymin+m
        }
    }
    
    var newRectArr2 = [Rect]()
    
    // O(200,000)
    for rec in newRectArr1.sorted{$0.xmin < $1.xmin}{ //O(200,000 * log(200,000))
        let m = xCoord[rec.ymin+1...rec.ymax].max()!
        newRectArr2.append(Rect(rec.index, m, rec.ymin, rec.xmax-rec.xmin+m, rec.ymax))
        for i in rec.ymin+1...rec.ymax{
            xCoord[i] = rec.xmax-rec.xmin+m
        }
    }
    
    var answer = [String]()
    // O(200,000)
    for rec in newRectArr2.sorted{$0.index < $1.index}{ //O(200,000 * log(200,000))
        answer.append("\(rec.xmin) \(rec.ymin) \(rec.xmax) \(rec.ymax)")
    }
    
    // O(3n*(logn+1)) --> O(18n)
    return answer
}
