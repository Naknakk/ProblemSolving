
let nm = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let n = nm[0], m = nm[1]
var paper = Array(repeating: [0], count: n)
for i in 0..<n {
    paper[i] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
}

var drawCnt = 0
var drawMax = 0

let dr = [-1, 0, 1, 0], dc = [0, 1, 0, -1]
let visited = 2
let color = 1

for r in 0..<n {
    for c in 0..<m {
        
        if paper[r][c] != color {
            continue
        }
        
        paper[r][c] = visited
        drawCnt += 1
        
        var drawSize = 1
        var current = [(r, c)]
        var pointer = 0
        
        while pointer < current.count {
            let cur = current[pointer]
            
            for i in 0..<4 {
                let nr = cur.0+dr[i]
                let nc = cur.1+dc[i]
                
                if nr<0 || nr>n-1 || nc<0 || nc>m-1 {
                    continue
                }
                if paper[nr][nc] == color {
                    paper[nr][nc] = visited
                    drawSize += 1
                    current.append((nr, nc))
                }
            }
            pointer += 1
        }
        
        drawMax = max(drawMax, drawSize)
    }
}
print("\(drawCnt)\n\(drawMax)")
