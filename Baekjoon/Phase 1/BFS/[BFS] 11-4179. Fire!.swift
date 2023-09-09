// 276ms a 방식으로 푼 것.
let RC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let R = RC[0], C = RC[1]
var map: [[Character]] = []
for _ in 0..<R {
    map.append(Array(readLine()!))
}

let line = Array(repeating: -1, count: C)
var fDist = Array(repeating: line, count: R)
var jDist = Array(repeating: line, count: R)

var fQue: [(Int, Int)] = []
var jQue: [(Int, Int)] = []
var pointer = 0
let dr = [0, -1, 0, 1], dc = [1, 0, -1, 0]

for r in 0..<R {
    for c in 0..<C {
        if map[r][c] == "J" {
            map[r][c] == "."
            jQue.append((r, c))
            jDist[r][c] = 0
        }
        if map[r][c] == "F" {
            fQue.append((r, c))
            fDist[r][c] = 0
        }
    }
}

while pointer < fQue.count {
    let cur = fQue[pointer]
    
    for i in 0..<4 {
        let nr = cur.0+dr[i]
        let nc = cur.1+dc[i]
        
        if nr<0 || nr>R-1 || nc<0 || nc>C-1 {
            continue
        }
        
        if (map[nr][nc] == "." || map[nr][nc] == "J") && fDist[nr][nc] == -1 {
            fDist[nr][nc] = fDist[cur.0][cur.1] + 1
            fQue.append((nr, nc))
        }
    }
    pointer += 1
}


var result = "IMPOSSIBLE"
pointer = 0

bfs: while pointer < jQue.count {
    let cur = jQue[pointer]
    
    for i in 0..<4 {
        let nr = cur.0+dr[i]
        let nc = cur.1+dc[i]
        
        if nr<0 || nr>R-1 || nc<0 || nc>C-1 {
            result = "\(jDist[cur.0][cur.1]+1)"
            break bfs
        }
        
        if(map[nr][nc] == "." && jDist[nr][nc] == -1) {
            jDist[nr][nc] = jDist[cur.0][cur.1] + 1
            if (jDist[nr][nc] < fDist[nr][nc]) || fDist[nr][nc] == -1 {
                jQue.append((nr, nc))
            }
        }
    }
    pointer += 1
}
print(result)

// 176ms의 좋은 풀이. 전체를 다 돌지 않고 최단거리로 탈출하면 바로 끝이다.
let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (RC[0], RC[1])

var map = [[String]]()

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var jihoon = [(Int, Int)]()
var fire = [(Int, Int)]()
var visit = Array(repeating: Array(repeating: false, count: C), count: R)
var exit = false
for i in 0..<R {
    map.append(readLine()!.map{String($0)})
    for j in 0..<map[i].count {
        if map[i][j] == "J" {
            map[i][j] = "."
            jihoon.append((i, j))
        }
        else if map[i][j] == "F" {
            fire.append((i, j))
        }
    }
}

func moveJihoon() {
    var tempJihoon = [(Int, Int)]()
    
    for i in 0..<jihoon.count {
        for j in 0...3 {
            let nX = jihoon[i].0 + dx[j]
            let nY = jihoon[i].1 + dy[j]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C {
                exit = true
                break
            }
            
            if map[nX][nY] == "." && !visit[nX][nY] {
                tempJihoon.append((nX,nY))
                visit[nX][nY] = true
            }
        }
    }
    jihoon = tempJihoon
}

func burnburn() {
    var tempFire = [(Int, Int)]()
    
    for i in 0..<fire.count {
        for j in 0...3 {
            let nX = fire[i].0 + dx[j]
            let nY = fire[i].1 + dy[j]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C {
                continue
            }
            
            if map[nX][nY] == "." {
                map[nX][nY] = "F"
                tempFire.append((nX,nY))
            }
        }
    }
    fire = tempFire
}

var count = 0

while true {
    burnburn()
    moveJihoon()
    count += 1
    if exit == true { print(count); break }
    if jihoon.isEmpty { print("IMPOSSIBLE"); break }
}
