let N = Int(readLine()!)!

var lines: [(Int, Int)] = []
for _ in 0..<N {
    let line = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    lines.append((line[0], line[1]))
}

lines.sort(by: {$0.0 < $1.0})

var dp: [Int] = Array(repeating: 0, count: N)
dp[0] = 1

for i in 1..<N {
    var maxDP = 0
    for j in stride(from: i-1, through: 0, by: -1) {
        if lines[j].1 < lines[i].1 {
            maxDP = max(dp[j], maxDP)
        }
    }
    
    dp[i] = maxDP + 1
}

print(N - dp.max()!)