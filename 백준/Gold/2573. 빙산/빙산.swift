let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]

var initialVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
var visited = initialVisited
var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}

let dr = [1, -1, 0, 0], dc = [0, 0, 1, -1]
var blobCount = 1
var que: [(Int, Int)] = []
var nextHeights: [Int] = []
var yearCount = -1

while blobCount == 1 {
    setNextHeights()
    initialize()
    scan()
}

print(blobCount == 0 ? 0 : yearCount)

func initialize() {
    yearCount += 1
    blobCount = 0
    visited = initialVisited
    que = []
    nextHeights = []
}

func scan() {
    for r in 1..<N-1 {
        for c in 1..<M-1 {
            if map[r][c] != 0 && !visited[r][c] {
                blobCount += 1
                que.append((r, c))
                nextHeights.append(getNextHeight((r, c)))
                bfs()
            }
        }
    }
}

func bfs() {
    var pointer = 0
    while pointer < que.count {
        let cur = que[pointer]
            
        for i in 0..<4 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
                
            if map[nr][nc] != 0 && !visited[nr][nc] {
                que.append((nr, nc))
                nextHeights.append(getNextHeight((nr, nc)))
                visited[nr][nc] = true
            }
        }
        
        pointer += 1
    }
}

func getNextHeight(_ center: (Int, Int)) -> Int {
    var count = 0
    
    for i in 0..<4 {
        let nr = center.0+dr[i]
        let nc = center.1+dc[i]
        
        if map[nr][nc] == 0 {
            count += 1
        }
    }
    
    return max(map[center.0][center.1]-count, 0)
}

func setNextHeights() {
    for i in 0..<que.count {
        let cur = que[i]
        map[cur.0][cur.1] = nextHeights[i]
    }
}
