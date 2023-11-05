let N = Int(readLine()!)!
var map: [[Int]] = []

for _ in 0..<N {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}

for i in 1..<N {
    for j in 0..<i+1 {
        if j == 0 {
            map[i][j] += map[i-1][j]
        } else if j == i {
            map[i][j] += map[i-1][j-1]
        } else {
            map[i][j] += max(map[i-1][j], map[i-1][j-1])
        }
    }
}
print(map[N-1].max()!)