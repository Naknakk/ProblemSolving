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
    for i in 0..<leafNodes.count {  // 여기서 시간 복잡도 O(N^2)를 만든 것이 시간초과의 원인.
        var map = Array(repeating: 0, count: N)
        var pointer = 0
        var current = [abc[j]]
    
        Outer: while pointer < current.count {
            let cur = current[pointer]
        
            for next in connections[cur] {
                map[next] = map[cur] + 1
            
                if next == leafNodes[i] {
                    distances[j][i] = map[next]
                    break Outer
                }
                current.append(next)
            }
            pointer += 1
        }
    }
}
var result = "NO"
for i in 0..<leafNodes.count {
    if distances[0][i] < distances[1][i] && distances[0][i] < distances[2][i] {
        result = "YES"
    }
}
print(result)


// 시간복잡도 O(N+N+N+3*(N+N)+N)으로, O(N)에 들어왔다!
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


// 버전 2. 432 ms 경찰은 동일한 종류의 시작점이므로 세번 도는 것에서 두번 전체를 도는 것으로 수정.
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
let startPoints = [[abc[0]], [abc[1], abc[2]]]
let distance = Array(repeating: 0, count: leafNodes.count)
var distances = Array(repeating: distance, count: 2)

for j in 0..<2 {
        var map = Array(repeating: -1, count: N)
        var pointer = 0
        var current = startPoints[j]
        for cur in current {
            map[cur] = 0
        }
    
        while pointer < current.count && distances[j].contains(0) {
            let cur = current[pointer]
        
            for next in connections[cur] {
                if map[next] != -1 {
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
    if distances[0][i] < distances[1][i] {
        result = "YES"
    }
}
print(result)


// 코드는 좀 길지만..C 방식 420ms
let N = Int(readLine()!)!

var connections: [[Int]] = Array(repeating: [], count: N)
for _ in 0..<N-1 {
    let connect = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
    connections[connect[0]].append(connect[1])
    connections[connect[1]].append(connect[0])
}

let abc = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
let policeVisited = 0, yoonVisited = 1, notVisited = -1
var map = Array(repeating: notVisited, count: N)

var policeCur = [abc[1], abc[2]], yoonCur = [abc[0]]
map[policeCur[0]] = policeVisited
map[policeCur[1]] = policeVisited
map[yoonCur[0]] = yoonVisited

var result = connections[yoonCur[0]].count == 1 ? "YES" : "NO"

func policeMove() {
    var policeNext: [Int] = []
    var pointer = 0
    
    while pointer < policeCur.count  {
        let cur = policeCur[pointer]
        
        for next in connections[cur] {
            if map[next] == policeVisited {
                continue
            }
            map[next] = policeVisited
            
            policeNext.append(next)
        }
        pointer += 1
    }
    policeCur = policeNext
}

func yoonMove() {
    var yoonNext: [Int] = []
    var pointer = 0
    
    bfs: while pointer < yoonCur.count  {
        let cur = yoonCur[pointer]
        
        for next in connections[cur] {
            if map[next] != notVisited {
                continue
            } else if connections[next].count == 1 {
                result = "YES"
                break bfs
            }
            map[next] = yoonVisited
            
            yoonNext.append(next)
        }
        pointer += 1
    }
    yoonCur = yoonNext
}

while result != "YES" {
    policeMove()
    yoonMove()
    if yoonCur.isEmpty { break }
}

print(result)
