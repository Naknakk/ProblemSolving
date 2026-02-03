import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue: [(Int, Int)] = []
    
    for i in 0..<priorities.count {
        queue.append((i, priorities[i]))
    }
    
    var queuePointer = 0
    var targetProcess = location
    var currentMax = priorities.sorted{$0 > $1}
    var maxPointer = 0
    var endProcess = 0
    
    while true {
        let target = queue[queuePointer]
        if target.1 == currentMax[maxPointer] {
            endProcess += 1
            maxPointer += 1
            
            if target.0 == targetProcess { break }
        } else {
            queue.append(target)
        }
        queuePointer += 1
    }
    
    
    return endProcess
}