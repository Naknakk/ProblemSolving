import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var remains: [Int] = Array(repeating: 0, count: progresses.count)
    
    for i in 0..<progresses.count {
        var currentProgress = progresses[i]
        let speed = speeds[i]
        var time = 0
        
        while currentProgress < 100 {
            time += 1
            currentProgress += speed
        } 
        
        remains[i] = time
    }
    
    var day = 0
    var result: [Int] = []
    var startIndex = 0
    
    while startIndex < remains.count {
        day += 1
        var endProcess = 0
        
        for i in startIndex..<remains.count {
            if remains[i] > day {
                break
            }
            
            startIndex += 1
            endProcess += 1
        }
        
        if endProcess != 0 {
            result.append(endProcess)
        }
    }
    
    
    return result
}