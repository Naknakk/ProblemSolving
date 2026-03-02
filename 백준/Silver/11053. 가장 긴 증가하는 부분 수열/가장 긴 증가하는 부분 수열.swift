let N = Int(readLine()!)!
var sequence: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var dp: [Int] = Array(repeating: 0, count: N)
dp[0] = 1

for i in 1..<N {
    var maxDP = 0
    Inner: for j in stride(from: i-1, through: 0, by: -1) {
        if sequence[j] < sequence[i] {
            maxDP = max(dp[j], maxDP)
        }
    }
    dp[i] = maxDP+1
}

print(dp.max()!)