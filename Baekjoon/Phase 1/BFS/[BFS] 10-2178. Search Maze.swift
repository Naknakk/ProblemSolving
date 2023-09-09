let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])

var map = Array(repeating: [0], count: N)
for i in 0..<N {
    map[i] = Array(readLine()!).map{Int(String($0))!}
}

let wall = 0
let road = 1
let endPoint = (N-1, M-1)

var queue: [(Int, Int)] = [(0, 0)]
let dr = [-1, 0, 0, 1]
let dc = [0, 1, -1, 0]
var pointer = 0

while pointer < queue.count {
    let cur = queue[pointer]

    for i in 0..<4 {
        let nr = cur.0+dr[i]
        let nc = cur.1+dc[i]
        
        if nr>N-1 || nr<0 || nc>M-1 || nc<0 {
            continue
        }
        
        if map[nr][nc] == road {
            map[nr][nc] = map[cur.0][cur.1] + 1
            queue.append((nr, nc))
        }
    }
    pointer += 1
}

print(map[N-1][M-1])
