let nmv = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let n = nmv[0], m = nmv[1], v = nmv[2]
var connections: [Set<Int>] = Array(repeating: [], count: n+1)
for _ in 0..<m {
    let connect = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    connections[connect[0]].insert(connect[1])
    connections[connect[1]].insert(connect[0])
}

func bfs(start: Int) -> [Int]{
    var map: [Int] = Array(repeating: 0, count: n+1)
    var que: [Int] = [v]
    map[v] = 1
    var pointer = 0

    while pointer < que.count {
        let cur = que[pointer]
    
        for next in connections[cur].sorted() {
            if map[next] == 1 {
                continue
            }
            map[next] = 1
            que.append(next)
        }
        pointer += 1
    }
    return que
}


var map: [Int] = Array(repeating: 0, count: n+1)

func dfs(cur: Int) -> [Int] {
    if map[cur] == 1 {
        return []
    }
    var result = [cur]
    map[cur] = 1
    
    for next in connections[cur].sorted() {
        result += dfs(cur: next)
    }
    return result
}

var outputDfs = ""
for i in dfs(cur: v) {
    outputDfs += "\(i) "
}

var outputBfs = ""
for i in bfs(start: v) {
   outputBfs += "\(i) "
}

print(outputDfs)
print(outputBfs)