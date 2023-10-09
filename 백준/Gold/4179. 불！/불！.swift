// 전체를 다 돌지 않고 최단거리로 탈출하면 바로 끝이다. O(N)
let RC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let R = RC[0], C = RC[1]
var map: [[String]] = []
for _ in 0..<R {
    map.append(Array(readLine()!).map{String($0)})
}
var jihoonQue: [(Int, Int)] = []
var fireQue: [(Int, Int)] = []

for r in 0..<R {
    for c in 0..<C {
        if map[r][c] == "J" {
            map[r][c] = "."
            jihoonQue.append((r, c))
        } else if map[r][c] == "F" {
            fireQue.append((r, c))
        }
    }
}

let dr = [0, 0, -1, 1], dc = [-1, 1, 0, 0]
let wall = "#", notVisited = ".", fireVisited = "F", jihoonVisited = "J"
var result = "IMPOSSIBLE"
var count = 0

func jihoonMove() {
    var jihoonNext: [(Int, Int)] = []
    var pointer = 0
    
    while pointer < jihoonQue.count {
        let cur = jihoonQue[pointer]
        
        for i in 0..<4 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
            
            if nr<0 || nr>=R || nc<0 || nc>=C {
                result = "\(count)"
                break
            }
            
            if map[nr][nc] == notVisited {
                jihoonNext.append((nr,nc))
                map[nr][nc] = jihoonVisited
            }
        }
        pointer += 1
    }
    jihoonQue = jihoonNext
    
}

func fireMove() {
    var fireNext: [(Int, Int)] = []
    var pointer = 0
    
    while pointer < fireQue.count {
        let cur = fireQue[pointer]
        
        for i in 0..<4 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
            
            if nr<0 || nr>=R || nc<0 || nc>=C {
                continue
            }
            
            if map[nr][nc] != fireVisited && map[nr][nc] != wall {
                fireNext.append((nr,nc))
                map[nr][nc] = fireVisited
            }
        }
        pointer += 1
    }
    fireQue = fireNext
}

while result == "IMPOSSIBLE" {
    count += 1
    fireMove()
    jihoonMove()
    if jihoonQue.isEmpty {
        break
    }
}
print(result)