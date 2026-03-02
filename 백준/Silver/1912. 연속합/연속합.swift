let N = Int(readLine()!)!
let sequence: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var dp: [Int] = sequence

for i in 1..<N {
    dp[i] = max(dp[i-1]+dp[i], dp[i])
}

print(dp.max()!)