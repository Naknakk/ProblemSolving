while true {
    let LRC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let L = LRC[0], R = LRC[1], C = LRC[2]
    if L == 0 {
        break
    }
    
    var distances: [[[Int]]] = Array(
        repeating: Array(
            repeating: Array(repeating: -1, count: C),
            count: R),
        count: L)
    
    var building: [[[Character]]] = []
    for _ in 0..<L {
        var floor: [[Character]] = []
        for _ in 0..<R {
            floor.append(Array(readLine()!))
        }
        _ = readLine()
        building.append(floor)
    }
    
    var que: [(Int, Int, Int)] = []
    var pointer = 0
    let dl = [0, 0, 0, 0, -1, 1]
    let dr = [0, 0, -1, 1, 0, 0]
    let dc = [-1, 1, 0, 0, 0, 0]
    
    SLoop: for l in 0..<L {
        for r in 0..<R {
            for c in 0..<C {
                if building[l][r][c] == "S" {
                    que.append((l, r, c))
                    distances[l][r][c] = 0
                    break SLoop
                }
            }
        }
    }
    
    var result = "Trapped!"
    
    bfs: while pointer < que.count {
        let cur = que[pointer]
        
        for i in 0..<6 {
            let nl = cur.0+dl[i]
            let nr = cur.1+dr[i]
            let nc = cur.2+dc[i]
            
            if nl<0 || nl>L-1 || nr<0 || nr>R-1 || nc<0 || nc>C-1 {
                continue
            }
            
            if building[nl][nr][nc] == "E" {
                distances[nl][nr][nc] = distances[cur.0][cur.1][cur.2] + 1
                result = "Escaped in \(distances[nl][nr][nc]) minute(s)."
                break bfs
            }
            
            if building[nl][nr][nc] == "." && distances[nl][nr][nc] == -1 {
                distances[nl][nr][nc] = distances[cur.0][cur.1][cur.2] + 1
                que.append((nl, nr, nc))
            }
        }
        pointer += 1
    }
    print(result)
}