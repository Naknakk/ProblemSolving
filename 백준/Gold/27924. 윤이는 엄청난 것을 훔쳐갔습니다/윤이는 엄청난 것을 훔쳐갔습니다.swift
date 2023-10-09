let N = Int(readLine()!)!

var connections: [[Int]] = Array(repeating: [], count: N)
for _ in 0..<N-1 {
    let connect = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
    connections[connect[0]].append(connect[1])
    connections[connect[1]].append(connect[0])
}
var leafNodes: [Int] = []

for i in 0..<N {
    if connections[i].count == 1 {
        leafNodes.append(i)
    }
}

let abc = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
let distance = Array(repeating: 0, count: leafNodes.count)
var distances = Array(repeating: distance, count: 3)

for j in 0..<3 {
        var map = Array(repeating: 0, count: N)
        var pointer = 0
        var current = [abc[j]]
    
        while pointer < current.count && distances[j].contains(0) {
            let cur = current[pointer]
        
            for next in connections[cur] {
                if map[next] != 0 || next == abc[j] {
                    continue
                }
                map[next] = map[cur] + 1
                
                current.append(next)
                
                
            }
            pointer += 1
        }
        
        for i in 0..<leafNodes.count {
            distances[j][i] = map[leafNodes[i]]
        }
}

var result = "NO"
for i in 0..<leafNodes.count {
    if distances[0][i] < distances[1][i] && distances[0][i] < distances[2][i] {
        result = "YES"  
    }
}
print(result)