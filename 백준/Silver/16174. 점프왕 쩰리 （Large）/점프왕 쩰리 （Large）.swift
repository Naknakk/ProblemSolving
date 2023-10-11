let N = Int(readLine()!)!

var map: [[Int]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}


var queue: [(Int, Int)] = [(0, 0)]
visited[0][0] = true

let dr = [1, 0], dc = [0, 1]
var isEscaped = false
var result = "Hing"

func bfs() {
    var nextQue: [(Int, Int)] = []
    
    Outer: for i in 0..<queue.count {
        let cur = queue[i]
        let magnitude = map[cur.0][cur.1]
        
        Inner: for j in 0..<2 {
            let nr = cur.0 + dr[j]*magnitude
            let nc = cur.1 + dc[j]*magnitude
            
            if nr<0 || nc<0 || nr>=N || nc>=N {
                continue Inner
            }
            if map[nr][nc] == -1 {
                isEscaped = true
                result = "HaruHaru"
                break Outer
            }
            if !visited[nr][nc] {
                visited[nr][nc] = true
                nextQue.append((nr, nc))
            }
            
        }
    }
    queue = nextQue
}

while !isEscaped {
    bfs()
    
    if queue.isEmpty {
        isEscaped = true
    }
}

print(result)