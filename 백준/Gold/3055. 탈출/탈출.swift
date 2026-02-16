var RC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let R = RC[0], C = RC[1]
var map: [[String]] = []
var dist: [[Int]] = []

for _ in 0..<R {
    map.append(Array(readLine()!).map{String($0)})
    dist.append(Array(repeating: -1, count: C))
}

var queue: [(Int, Int, String)] = []
var pointer = 0

for i in 0..<R {
    for j in 0..<C {
        if map[i][j] == "*" {
            queue.append((i, j, "*"))
        }
    }
}
for i in 0..<R {
    for j in 0..<C {
        if map[i][j] == "S" {
            queue.append((i, j, "S"))
            dist[i][j] = 0
        }
    }
}

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]
var ans = 0

while pointer < queue.count {
    let cur = queue[pointer]
    if cur.2 == "S" && map[cur.0][cur.1] == "D" {
        ans = dist[cur.0][cur.1]
        break
    }
    
    for i in 0..<4 {
        let nr = cur.0 + dr[i]
        let nc = cur.1 + dc[i]
        
        if nr<0 || nr>=R || nc<0 || nc>=C {
            continue
        }
        
        if cur.2 == "*" {
            if map[nr][nc] == "." || map[nr][nc] == "S" {
                map[nr][nc] = "*"
                queue.append((nr, nc, "*"))
            }
        } else {
            if map[nr][nc] == "." || map[nr][nc] == "D" {
                if dist[nr][nc] == -1 {
                    dist[nr][nc] = dist[cur.0][cur.1] + 1
                    queue.append((nr, nc, "S"))
                }
            }
        }
    }
    
    pointer += 1
}

print(ans == 0 ? "KAKTUS" : ans)