let n = Int(readLine()!)!
var map: [[Int]] = []
var sizes: [Int] = []

for _ in 0..<n {
    map.append(Array(readLine()!).map{Int(String($0))!})
}

let newHouse = 1, checkedHouse = 2
let dr = [1, -1, 0, 0], dc = [0, 0, 1, -1]

func bfs(start: (Int, Int)) -> Int {
    var que: [(Int, Int)] = [start]
    var pointer = 0
    
    map[start.0][start.1] = checkedHouse
    var size = 1
    
    while pointer < que.count {
        let cur = que[pointer]
        
        for i in 0..<4 {
            let nr = cur.0+dr[i], nc = cur.1+dc[i]
            
            if nc<0 || nc>n-1 || nr<0 || nr>n-1 {
                continue
            }
            
            if map[nr][nc] == newHouse {
                map[nr][nc] = checkedHouse
                size += 1
                que.append( (nr, nc) )
            }
        }
        pointer += 1
    }
    
    return size
}

for r in 0..<n {
    for c in 0..<n {
        if map[r][c] == newHouse {
            sizes.append( bfs(start: (r, c)) )
        }
    }
}

print(sizes.count)
for size in sizes.sorted(by: <) {
    print(size)
}