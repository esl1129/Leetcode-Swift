import Foundation

func solution(_ record:[String]) -> [Int] {
    var fifo: [Int] = []
    var filo: [Int] = []
    var answer = [0,0]
    var arrSize = 0
    for re in record {
        let line = re.components(separatedBy: " ").map{String($0)}
        if line[0] == "P"{
            let buy = [Int](repeating: Int(line[1])!, count: Int(line[2])!)
            arrSize += Int(line[2])!
            fifo += buy
            filo += buy
        }else{
            let range = Int(line[2])!
            answer[1] += Array(filo[arrSize-range..<arrSize]).reduce(0,+)
            filo = range >= arrSize ? [] : Array(filo[0..<arrSize-range])
            answer[0] += Array(fifo[0..<range]).reduce(0,+)
            fifo = range >= arrSize ? [] : Array(fifo[range..<arrSize])
            arrSize -= range
        }
    }
    return answer
}
