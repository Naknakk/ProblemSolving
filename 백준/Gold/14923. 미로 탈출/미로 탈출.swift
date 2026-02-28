let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]
let HxHy = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
let ExEy = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}

var map: [[Int]] = []

for _ in 0..<N {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]

let exit: (Int, Int) = (ExEy[0], ExEy[1])
var queue: [(Int, Int, Int)] = [(HxHy[0], HxHy[1], 0)]
var pointer = 0
var dist: [[[Int]]] = Array(repeating: Array(repeating: [-1, -1], count: M), count: N)
dist[HxHy[0]][HxHy[1]][0] = 0
var ans = -1

while pointer < queue.count {
    let cur = queue[pointer]
    
    if cur.0 == exit.0 && cur.1 == exit.1 {
        ans = dist[cur.0][cur.1][cur.2]
        break
    }
    
    for i in 0..<4 {
        let nr = cur.0 + dr[i]
        let nc = cur.1 + dc[i]
        let broken = cur.2
        
        if nr<0 || nr>=N || nc<0 || nc>=M {
            continue
        }
        
        if broken == 0 && map[nr][nc] == 1 && dist[nr][nc][1] == -1  {
            queue.append((nr, nc, 1))
            dist[nr][nc][1] = dist[cur.0][cur.1][cur.2] + 1
        }
        
        if map[nr][nc] == 0 && dist[nr][nc][cur.2] == -1 {
            queue.append((nr, nc, cur.2))
            dist[nr][nc][cur.2] = dist[cur.0][cur.1][cur.2] + 1
        }
    }
    
    pointer += 1
}

print(ans)
