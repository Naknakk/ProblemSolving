let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (M, N): (Int, Int) = (input[0], input[1])

var map: [[Int]] = []
var current: [(Int, Int)] = []

for i in 0..<N {
    let line = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    map.append(line)
}
for row in 0..<N {
    for column in 0..<M {
        if map[row][column] == 1 {
            current.append((row, column))
        }
    }
}
var pointer = 0
var curCount = current.count
var dx = [-1, 0, 1, 0]
var dy = [0, -1, 0, 1]
var result = 0

while pointer != curCount {
    let cur = current[pointer]
    
    for i in 0..<4 {
        let nx = cur.0+dx[i]
        let ny = cur.1+dy[i]
        
        if nx<0 || nx>=N || ny<0 || ny>=M {
            continue
        }
        if map[nx][ny] == 0 {
            map[nx][ny] = map[cur.0][cur.1] + 1  // 며칠이 걸리는지 쉽게 체크하기 위해 하루 지날때마다 숫자가 커진다.
            current.append((nx, ny))
            curCount += 1
        }
    }
    pointer += 1
}

// 안익은 토마토가 있는지 체크, 며칠걸렸는지 체크.
for row in 0..<N {
    if map[row].contains(0) {
        result = -1
        break
    } else {
        let day = map[row].max()!-1
        if result < day {
            result = day
        }
    }
}

print(result)
