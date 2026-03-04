// .: 빈칸
// #: 벽
// abcdef : 열쇠 줍는 칸 (여러개 가능)
// ABCDEF : 문, 대응하는 열쇠가 필요 (여러개 가능, 대응하는 열쇠가 없기도 함)
// 0 : 현재위치, 빈칸 (한 개)
// 1: 출구 (한 개 이상)

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]
var map: [[String]] = []
for _ in 0..<N {
    map.append(Array(readLine()!).map{String($0)})
}

let keyBits: [String: UInt8] = [
    "a": 0b00000001, 
    "b": 0b00000010, 
    "c": 0b00000100,
    "d": 0b00001000,
    "e": 0b00010000,
    "f": 0b00100000
]

let doorBits: [String: UInt8] = [
    "A": 0b00000001, 
    "B": 0b00000010, 
    "C": 0b00000100,
    "D": 0b00001000,
    "E": 0b00010000,
    "F": 0b00100000
]

var dist: [[[Int]]] = Array(
    repeating: Array(
        repeating: Array(
            repeating: -1,
            count: 64),
        count: M),
    count: N)

var queue: [(Int, Int, UInt8)] = []
var pointer = 0
for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == "0" {
            queue.append((i, j, 0b00000000))
            dist[i][j][0] = 0
        }
    }
}

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]
let doors: Set<String> = ["A", "B", "C", "D", "E", "F"]
let keys: Set<String> = ["a", "b", "c", "d", "e", "f"]

var ans = -1

while pointer < queue.count {
    let cur = queue[pointer]
    pointer += 1
    
    if map[cur.0][cur.1] == "1" {
        ans = dist[cur.0][cur.1][Int(cur.2)]
        break
    }
    
    for i in 0..<4 {
        let nr = cur.0 + dr[i]
        let nc = cur.1 + dc[i]
        
        if nr<0 || nr>=N || nc<0 || nc>=M {
            continue
        }
        
        if (map[nr][nc] == "." || map[nr][nc] == "1" || map[nr][nc] == "0") && dist[nr][nc][Int(cur.2)] == -1 {
            queue.append((nr, nc, cur.2))
            dist[nr][nc][Int(cur.2)] = dist[cur.0][cur.1][Int(cur.2)] + 1
        } else if keys.contains(map[nr][nc]) {
            let keySet = cur.2 | keyBits[map[nr][nc]]!
            if dist[nr][nc][Int(keySet)] == -1 {
                queue.append((nr, nc, keySet))
                dist[nr][nc][Int(keySet)] = dist[cur.0][cur.1][Int(cur.2)] + 1
            }
        } else if doors.contains(map[nr][nc]) {
            let isOpen = cur.2 & doorBits[map[nr][nc]]!
            if Int(isOpen) != 0 && dist[nr][nc][Int(cur.2)] == -1 {
                queue.append((nr, nc, cur.2))
                dist[nr][nc][Int(cur.2)] = dist[cur.0][cur.1][Int(cur.2)] + 1
            }
        }
    }
}

print(ans)

