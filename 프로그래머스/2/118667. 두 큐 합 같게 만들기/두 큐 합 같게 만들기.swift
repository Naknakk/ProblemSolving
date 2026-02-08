import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var arr = queue1 + queue2
    let sum = arr.reduce(0, +)
    
    if sum%2 != 0 { return -1 }
    let target = sum / 2 
    
    var st = 0
    var en = queue1.count-1
    var currentSum = queue1.reduce(0, +)
    var count = 0
    
    while true {
        if currentSum < target {
            en += 1
            guard en < arr.count else { return -1 }
            currentSum += arr[en]
            count += 1
        } else if currentSum > target {
            guard st < arr.count  else { return -1 }
            currentSum -= arr[st]
            st += 1
            count += 1
        } else {
            return count
        }
    }
}