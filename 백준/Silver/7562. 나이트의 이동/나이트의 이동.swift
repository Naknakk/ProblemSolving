let caseCount = Int(readLine()!)!

let dr = [1, 2, 2, 1, -1, -2, -2, -1]
let dc = [-2, -1, 1, 2, 2, 1, -1, -2]

for _ in 0..<caseCount {
    let N = Int(readLine()!)!
    let current = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let target = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    
    var dist: [[Int]] = Array(repeating: Array(repeating: -1, count: N), count: N)
    var queue: [(Int, Int)] = [(current[0], current[1])]
    dist[current[0]][current[1]] = 0
    var pointer = 0
    
    INNER: while pointer < queue.count {
        let cur = queue[pointer]
        if cur == (target[0], target[1]) {
            print(dist[cur.0][cur.1])
            break INNER
        }
        
        for i in 0..<8 {
            let nr = cur.0 + dr[i]
            let nc = cur.1 + dc[i]
            
            if nr<0 || nr>=N || nc<0 || nc>=N {
                continue
            }
            
            if dist[nr][nc] == -1 {
                dist[nr][nc] = dist[cur.0][cur.1] + 1
                queue.append((nr, nc))
            } 
        }
        
        pointer += 1
    }
}