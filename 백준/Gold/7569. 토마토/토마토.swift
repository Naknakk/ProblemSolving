let MNH = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (M, N, H) = (MNH[0], MNH[1], MNH[2])
var map: [[[Int]]] = Array(repeating: [[]], count: H)

for h in 0..<H {
    var floor: [[Int]] = Array(repeating: [], count: N)
    for row in 0..<N {
        floor[row] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    }
    map[h] = floor
}

var current: [(Int, Int, Int)] = []
var pointer = 0
let dr = [0, 0, -1, 0, 1, 0]
let dc = [0, 0, 0, -1, 0, 1]
let dh = [-1, 1, 0, 0, 0, 0]

for h in 0..<H {
    for r in 0..<N {
        for c in 0..<M {
            if map[h][r][c] == 1 {
                current.append((h, r, c))
            }
        }
    }
}
var resultDay = 0

while pointer < current.count {
    let cur = current[pointer]
    
    for i in 0..<6 {
        let nh = cur.0+dh[i]
        let nr = cur.1+dr[i]
        let nc = cur.2+dc[i]
        
        if nr<0 || nr>N-1 || nc<0 || nc>M-1 || nh<0 || nh>H-1 {
            continue
        }
        if map[nh][nr][nc] == 0 {
            map[nh][nr][nc] = map[cur.0][cur.1][cur.2] + 1
            current.append((nh, nr, nc))
            resultDay = map[nh][nr][nc] - 1
        }
    }
    pointer += 1
}



OUTER: for h in 0..<H {
    for r in 0..<N {
        for c in 0..<M {
            if map[h][r][c] == 0 {
                resultDay = -1
                break OUTER
            }
        }
    }
}
print(resultDay)