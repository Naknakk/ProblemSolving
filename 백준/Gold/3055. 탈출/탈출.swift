let RC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let R = RC[0], C = RC[1]
var map: [[Character]] = Array(repeating: [], count: R)
for r in 0..<R {
    map[r] = Array(readLine()!)
}
var exit = (0, 0)
var sQue: [(Int, Int)] = [], wQue: [(Int, Int)] = []
var result = "KAKTUS"
var count = 0
var escaped = false
let dr = [1, -1, 0, 0], dc = [0, 0, 1, -1]

for r in 0..<R {
    for c in 0..<C {
        if map[r][c] == "D" {
            exit = (r, c)
        } else if map[r][c] == "S" {
            sQue.append((r, c))
        } else if map[r][c] == "*" {
            wQue.append((r, c))
        }
    }
}

func waterMove() {
    var pointer = 0
    var nextQue: [(Int, Int)] = []
    
    while pointer < wQue.count {
        let cur = wQue[pointer]
        
        for i in 0..<4 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
            
            if nr<0 || nr>R-1 || nc<0 || nc>C-1 {
                continue
            }
            if map[nr][nc] == "." || map[nr][nc] == "S" {
                map[nr][nc] = "*"
                nextQue.append((nr, nc))
            }
        }
        pointer += 1
    }
    wQue = nextQue
}

func sMove() {
    var pointer = 0
    var nextQue: [(Int, Int)] = []
    
    while pointer < sQue.count {
        let cur = sQue[pointer]
        
        for i in 0..<4 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
            
            if nr<0 || nr>R-1 || nc<0 || nc>C-1 {
                continue
            }
            if map[nr][nc] == "." {
                map[nr][nc] = "S"
                nextQue.append((nr, nc))
            } else if map[nr][nc] == "D" {
                escaped = true
                nextQue.append((nr, nc))
                result = "\(count)"
            }
        }
        pointer += 1
    }
    sQue = nextQue
}

bfs: while !escaped {
    count += 1
    waterMove()
    sMove()
    if sQue.isEmpty {
        break bfs
    }
}
print(result)