let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]
var map: [[Int]] = []
for _ in 0..<N {
    map.append(Array(readLine()!).map{Int(String($0))!})
}
var que: [(Int, Int)] = [(0, 0)]
var broken: [Bool] = [false]
let dr = [-1, 1, 0, 0], dc = [0, 0, -1, 1]
var visited = 2
var count = 1
var exit = (N==1 && M==1)
var result = exit ? 1 : -1
map[0][0] = visited

func bfs() {
    var nextQue: [(Int, Int)] = []
    var nextBroken: [Bool] = []
    
    bfs: for i in 0..<que.count {
        let cur = que[i]
        
        for j in 0..<4 {
            let nr = cur.0+dr[j]
            let nc = cur.1+dc[j]
            
            if nr<0 || nr>N-1 || nc<0 || nc>M-1 {
                continue
            }
            
            if (map[nr][nc] == 0 || map[nr][nc] == 3) && !broken[i] {
                map[nr][nc] = 4
                nextQue.append((nr, nc))
                nextBroken.append(broken[i])
            } else if map[nr][nc] == 1 && !broken[i] {
                map[nr][nc] = 2
                nextQue.append((nr, nc))
                nextBroken.append(true)
            } else if map[nr][nc] == 0 && broken[i] {
                map[nr][nc] = 3
                nextQue.append((nr, nc))
                nextBroken.append(broken[i])
            } 
        }
    }
    que = nextQue
    broken = nextBroken
}

while !exit {
    count += 1
    bfs()
    
    if map[N-1][M-1] != 0 {
        result = count
        exit = true
    } else if que.isEmpty {
        exit = true
    }
}
print(result)