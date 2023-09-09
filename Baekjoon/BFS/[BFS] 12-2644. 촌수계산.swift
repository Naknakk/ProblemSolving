let n = Int(readLine()!)!
let target = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
let m = Int(readLine()!)!
var connections: [[Int]] = Array(repeating: [], count: n)
for _ in 0..<m {
    let connect = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
    connections[connect[0]].append(connect[1])
    connections[connect[1]].append(connect[0])
}

var map: [Int] = Array(repeating: -1, count: n)

var que: [Int] = [target[0]]
map[target[0]] = 0
var pointer = 0

while pointer < que.count {
    let cur = que[pointer]
    
    for next in connections[cur] {
        if map[next] != -1 {
            continue
        }
        map[next] = map[cur] + 1
        que.append(next)
    }
    pointer += 1
}

print(map[target[1]])
