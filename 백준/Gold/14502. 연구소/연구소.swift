let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var map: [[Int]] = []
for _ in 0..<N {
    let row = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    map.append(row)
}

var everyEmtpySpaces: [(Int, Int)] = []
for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 0 {
            everyEmtpySpaces.append((i, j))
        }
    }
}
let limit = everyEmtpySpaces.count
var wallCases: [[Int]] = []
for i in 0..<limit-2 {
    for j in (i+1)..<limit-1 {
        for k in (j+1)..<limit {
            wallCases.append([i, j, k])
        }
    }
}

var ans = 0
let safe = 0
let wall = 1
let virus = 2
let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]

for wallCase in wallCases {
    var currentMap = map
    let coors = wallCase.map{everyEmtpySpaces[$0]}
    for coor in coors {
        currentMap[coor.0][coor.1] = wall
    }
    var queue: [(Int, Int)] = []
    var pointer = 0
    
    for i in 0..<N {
        for j in 0..<M {
            if currentMap[i][j] == virus {
                queue.append((i, j))
            }
        }
    }
    
    while pointer < queue.count {
        let cur = queue[pointer]
                
        for k in 0..<4 {
            let nr = cur.0 + dr[k]
            let nc = cur.1 + dc[k]
                    
            if nr<0 || nr>=N || nc<0 || nc>=M {
                continue
            }
            if currentMap[nr][nc] != safe {
                continue
            }
            currentMap[nr][nc] = virus
            queue.append((nr, nc))
        }
        pointer += 1
    }
    
    let result = currentMap.flatMap{$0}.filter{$0 == safe}.count
    ans = max(ans, result)
}

print(ans)
