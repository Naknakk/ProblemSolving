import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var arr = [0] + queue1 + queue2
    for i in 0..<arr.count-1 {
        arr[i+1] = arr[i] + arr[i+1]
    }
    
    let target = arr.last! / 2 
    if arr.last!%2 != 0 { return -1 }
    
    var st = 0
    var en = queue1.count
    var count = 0
    
    while true {
        let sum = arr[en] - arr[st]
        if sum < target {
            en += 1
            count += 1
        } else if sum > target {
            st += 1
            count += 1
        } else {
            return count
        }
        
        guard en < arr.count && st < arr.count  else { return -1 }
    }
}