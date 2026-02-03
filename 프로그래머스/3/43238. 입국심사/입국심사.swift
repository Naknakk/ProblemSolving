import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var max: Int64 = Int64(times.max()! * n)
    var min: Int64 = 1
    var mid: Int64 = (max+min)/2
    var result: Int64 = max
    
    while min <= max {
         mid = (max+min)/2
        if solve(n, times: times, limit: mid) {
            result = mid
            max = mid-1
        } else {
            min = mid+1
        }
    }
    
    
    return result
}


// 시간이 짧은 심사대는 계속 돌아가는 것으로 생각하면 된다.
// 사람이 너무 많아서, 1분당 시뮬레이션 형태로 구현하면 시간 부족.
// 따라서.. 제시된 시간 안에 몇명이 가능한지를 계산해보면 된다.
// 예를 들어, 30분 가능? -> 심사대 5분짜리에서 6명, 심사대 10분짜리에서 3명 ,, -> 9명까지 가능. but 사람은 10명 -> 불가능한 최소 시간이라는 뜻.
// 30분 제한일때 9분짜리 심사대는? 3명까지 가능.
func solve(_ n: Int, times: [Int], limit: Int64) -> Bool {
    var count: Int64 = 0
    
    for time in times {
        count += limit / Int64(time)
    }
    
    return count >= Int64(n)
}