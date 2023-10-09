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