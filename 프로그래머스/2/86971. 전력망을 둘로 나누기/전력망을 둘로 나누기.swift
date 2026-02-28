import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var edges: [[Int]] = Array(repeating: [], count: n+1)
    
    for wire in wires {
        edges[wire[0]].append(wire[1])
        edges[wire[1]].append(wire[0])
    }

    var minDiff = 100
    
    for wire in wires {
        var visitMap: [Bool] = Array(repeating: false, count: n+1)
        var queue: [Int] = [1]
        var pointer = 0
        visitMap[1] = true
        
        while pointer < queue.count {
            let cur = queue[pointer]
            
            for next in edges[cur] {
                if (cur, next) == (wire[0], wire[1]) || (cur, next) == (wire[1], wire[0]) {
                    continue
                }
                
                if !visitMap[next] {
                    visitMap[next] = true
                    queue.append(next)
                }
            }
            
            pointer += 1
        }
        
        let diff = abs(n-(queue.count*2))
        print(queue.count)
        minDiff = min(minDiff, diff)
    }
    
    
    return minDiff
}

// 단순하게 생각하기
// 각 전력선을 자를 때마다 양쪽 전력망의 크기를 계산해주기.
// -> 100개의 송전탑, 99개의 전력선
// -> 99가지 전력선 자르기 X 100개의 송전탑 탐색. -> 100^2 ... 괜찮은 듯 ?