let rc = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let r = rc[0], c = rc[1]

var map: [[Int]] = Array(repeating: [], count: r)
for i in 0..<r {
    map[i] = Array(readLine()!).map{Int(String($0))!}
}
var visited: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0,
                                                                  count: 2),
                                                 count: c), 
                                count: r)
visited[0][0][0] = 1

var que: [(Int, Int, Int)] = [(0, 0, 0)]
var pointer = 0
let dr = [1, -1, 0, 0], dc = [0, 0, 1, -1]
var result = -1

bfs: while pointer < que.count {
    let cur = que[pointer]
    
    for i in 0..<4 {
        let nr = cur.0+dr[i], nc = cur.1+dc[i]
        
        if nr<0 || nr>r-1 || nc<0 || nc>c-1 {
            continue
        }
        
        if cur.2 == 0 {
            if map[nr][nc] == 1 && visited[nr][nc][1] == 0 {
                visited[nr][nc][1] = visited[cur.0][cur.1][cur.2] + 1
                que.append((nr, nc, 1))
                
            }
            if map[nr][nc] == 0 && visited[nr][nc][0] == 0 {
                visited[nr][nc][0] = visited[cur.0][cur.1][cur.2] + 1
                que.append((nr, nc, 0))
            }
        } 
        
        if cur.2 == 1 {
            if map[nr][nc] == 0 && visited[nr][nc][1] == 0 {
                visited[nr][nc][1] = visited[cur.0][cur.1][cur.2] + 1
                que.append((nr, nc, 1))
            }
        }
    }
    
    if visited[r-1][c-1][0] != 0 || visited[r-1][c-1][1] != 0 {
        result = max(visited[r-1][c-1][0], visited[r-1][c-1][1])
        break bfs
    }
    
    pointer += 1
}
print(result)