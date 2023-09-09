let N = Int(readLine()!)!
let mapData: (fishSize: Int, visitCnt: Int, moveCnt: Int) = (0, 0, 0)
var map = Array(repeating: [mapData], count: N)
for i in 0..<N {
    map[i] = readLine()!.split{$0 == " "}.map{(Int(String($0))!, 0, 0)}
}

var queue: [(Int, Int)] = []
var pointer = 0
var dr = [-1, 0, 0, 1]
var dc = [0, -1, 1, 0]
var (visitN, level) = (1, 0)

var (size, eatN) = (2, 0)
var fishes: [(Int, Int)] = []
var move = 0

OUTER: for r in 0..<N {
    for c in 0..<N {
        if map[r][c] == (9, 0, 0) {
            queue.append((r, c))
            map[r][c] = (0, 1, 0)
            break OUTER
        }
    }
}

func eat(_ n: (Int, Int)) {
    eatN += 1
    
    if size == eatN {
        size += 1
        eatN = 0
    }
    
    visitN += 1
    move = map[n.0][n.1].moveCnt
    map[n.0][n.1].fishSize = 0
    map[n.0][n.1].visitCnt = visitN
    
    queue.append(n)
    pointer = queue.count-1
}

func select() -> (Int, Int) {
    var sr = N
    var sc = N
    
    for fish in fishes {
        if fish.0 < sr {
            sr = fish.0
            sc = fish.1
        } else if fish.0 == sr && fish.1 < sc {
            sc = fish.1
        }
    }
    fishes.removeAll()
    
    return (sr, sc)
}

while pointer < queue.count {
    
    let cur = queue[pointer]

    if level != map[cur.0][cur.1].moveCnt  {
        if !fishes.isEmpty {
            eat(select())
            continue
        }
        level += 1
    }
    
    for i in 0..<4 {
        let nr = cur.0+dr[i]
        let nc = cur.1+dc[i]
        
        if nr>N-1 || nr<0 || nc>N-1 || nc<0 {
            continue
        }
        
        if map[nr][nc].visitCnt < visitN && map[nr][nc].fishSize <= size {
            map[nr][nc].visitCnt = visitN
            map[nr][nc].moveCnt = map[cur.0][cur.1].moveCnt + 1
            queue.append((nr, nc))
            
            if map[nr][nc].fishSize != 0 && map[nr][nc].fishSize < size {
                fishes.append((nr, nc))
            }
        }
    }
    pointer += 1
}
print(move)
