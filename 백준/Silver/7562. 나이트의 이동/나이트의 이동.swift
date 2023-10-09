let t = Int(readLine()!)!
let dr = [-2, -2, -1, -1, 1, 1, 2, 2], dc = [-1, 1, -2, 2, -2, 2, -1, 1]
for _ in 0..<t {
    let l = Int(readLine()!)!
    let start = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let target = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    var map: [[Int]] = Array(repeating: Array(repeating: -1, count: l), count: l)
    map[start[0]][start[1]] = 0
    
    let isSame: Bool = (start == target)
    
    var que: [(Int, Int)] = [(start[0], start[1])]
    var pointer = 0
    
    bfs: while pointer < que.count && !isSame {
        let cur = que[pointer]
        
        for i in 0..<8 {
            let nr = cur.0+dr[i]
            let nc = cur.1+dc[i]
            
            if nr<0 || nr>l-1 || nc<0 || nc>l-1 {
                continue
            }
            
            if nr == target[0] && nc == target[1] {
                map[nr][nc] = map[cur.0][cur.1] + 1
                break bfs
            } else if map[nr][nc] == -1 {
                map[nr][nc] = map[cur.0][cur.1] + 1
                que.append((nr, nc))
            }
        }
        pointer += 1
    }
    
    print(map[target[0]][target[1]])
}