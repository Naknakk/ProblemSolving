let K = Int(readLine()!)!
let WH = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let W = WH[0], H = WH[1]

var map: [[Int]] = []
var dist: [[[Int]]] = []

for _ in 0..<H {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
    dist.append(Array(repeating: Array(repeating: -1, count: K+1), count: W))
}

var queue: [(Int, Int, Int)] = [(0, 0, 0)]
var pointer = 0
dist[0][0][0] = 0

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]

let hdr = [-2, -1, 1, 2, 2, 1, -1, -2]
let hdc = [-1, -2, -2, -1, 1, 2, 2, 1]

var ans = -1

while pointer < queue.count {
    let cur = queue[pointer]
    if cur.0 == H-1 && cur.1 == W-1 {
        ans = dist[cur.0][cur.1][cur.2]
        break
    }
    
    for i in 0..<4 {
        let nr = cur.0 + dr[i]
        let nc = cur.1 + dc[i]
        
        if nr<0 || nr>=H || nc<0 || nc>=W {
            continue
        }
        
        if map[nr][nc] == 0 && dist[nr][nc][cur.2] == -1 {
            queue.append((nr, nc, cur.2))
            dist[nr][nc][cur.2] = dist[cur.0][cur.1][cur.2] + 1
        }
    }
    
    pointer += 1
    
    guard cur.2 < K else { continue }
    
    for i in 0..<8 {
        let nr = cur.0 + hdr[i]
        let nc = cur.1 + hdc[i]
        
        if nr<0 || nr>=H || nc<0 || nc>=W {
            continue
        }
        
        if map[nr][nc] == 0 && dist[nr][nc][cur.2+1] == -1 {
            queue.append((nr, nc, cur.2+1))
            dist[nr][nc][cur.2+1] = dist[cur.0][cur.1][cur.2] + 1
        }
    }
}

print(ans)