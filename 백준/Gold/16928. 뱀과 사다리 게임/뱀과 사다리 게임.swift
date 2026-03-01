let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]

var edges: [Int: Int] = [:]
for _ in 0..<N {
    let xy = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    edges[xy[0]] = xy[1]
}

for _ in 0..<M {
    let uv = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    edges[uv[0]] = uv[1]
}

var dist: [Int] = Array(repeating: -1, count: 101)

var queue: [Int] = [1]
var pointer = 0
dist[1] = 0
let moves = [1, 2, 3, 4, 5, 6]


while pointer < queue.count {
    let cur = queue[pointer]
    pointer += 1
    if cur == 100 {
        print(dist[100])
        break
    }
    
    for move in moves {
        var next = cur + move
        
        if next > 100 {
            continue
        }
        
        if let edge = edges[next] {
            next = edge
        }
        
        if dist[next] == -1 {
            queue.append(next)
            dist[next] = dist[cur]+1
        }
    }
}