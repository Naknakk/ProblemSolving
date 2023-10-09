let T = Int(readLine()!)!
let brown = 0
let white = 1
let green = 2

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<T {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let (M, N, K): (Int, Int, Int) = (input[0], input[1], input[2])
    var line: [Int] = Array(repeating: 0, count: N)
    var map: [[Int]] = Array(repeating: line, count: M)
    var count = 0
    
    for _ in 0..<K {
        let cabbage = readLine()!.split{$0 == " "}.map{Int(String($0))!}
        map[cabbage[0]][cabbage[1]] = white
    }
    
    
    for x in 0..<M {
        for y in 0..<N {
            if map[x][y] != white { continue }
            count += 1
            var current: [[Int]] = [[x, y]]
            var nextSum: [[Int]] = []
            while !current.isEmpty {
                var next: [[Int]] = []
                let cur = current.removeLast()
                
                for i in 0..<4 {
                    let nx = cur[0]+dx[i]
                    let ny = cur[1]+dy[i]
                    
                    if (nx < 0 || nx > M-1 || ny < 0 || ny > N-1) {
                        continue
                    }
                    
                    if map[nx][ny] == white {
                        map[nx][ny] = green
                        next.append([nx, ny])
                    }
                }
                nextSum += next
                
                if current.isEmpty {
                    current = nextSum
                    nextSum = []
                }
            } 
        }
    }
    print(count)
}
