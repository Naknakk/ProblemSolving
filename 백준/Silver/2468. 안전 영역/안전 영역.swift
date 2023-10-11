let N = Int(readLine()!)!

var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}

var maxCount = 1, rainHeight = 1
var que: [(Int, Int)] = []
let dr = [-1, 1, 0, 0], dc = [0, 0, -1, 1]
var isAllFlooded = false

while !isAllFlooded {
    scan()
    rainHeight += 1
}

print(maxCount)

func scan() {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    var count = 0
    
    for r in 0..<N {
        for c in 0..<N {
            if map[r][c] > rainHeight && !visited[r][c] {
                count += 1
                que = [(r, c)]
                visited[r][c] = true
                
                while !que.isEmpty {
                    var nextQue: [(Int, Int)] = []
    
                    for i in 0..<que.count {
                        let cur = que[i]
        
                        for j in 0..<4 {
                            let nr = cur.0+dr[j]
                            let nc = cur.1+dc[j]
            
                            if nr<0 || nc<0 || nr>=N || nc >= N {
                                continue
                            }
            
                            if !visited[nr][nc] && map[nr][nc] > rainHeight {
                                nextQue.append((nr, nc))
                                visited[nr][nc] = true
                            }
                        }
                    }
                    que = nextQue
                }
            }
        }
    }
    
    if count == 0 {
        isAllFlooded = true
    } else {
        maxCount = max(maxCount, count)
    }
}