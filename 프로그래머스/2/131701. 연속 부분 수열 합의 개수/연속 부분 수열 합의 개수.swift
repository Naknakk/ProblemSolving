import Foundation

func solution(_ elements:[Int]) -> Int {
    
    var ans: Set<Int> = []
    var length = elements.count
    var arr = [0] + elements + elements
    
    for i in 0..<arr.count-1 {
        arr[i+1] = arr[i] + arr[i+1]
    }
    var st = 0
    var en = 1
    
    while st < length {
        while (en-st) < length {
            ans.insert(arr[en] - arr[st])
            en += 1
        }
        st += 1
        en = st+1
    }
    
    ans.insert(arr[length])
    
    return ans.count
}