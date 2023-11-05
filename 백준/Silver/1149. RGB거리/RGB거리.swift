let N = Int(readLine()!)!
var houses: [[Int]] = []

for _ in 0..<N {
    houses.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: N)
dp[0][0] = houses[0][0]
dp[0][1] = houses[0][1]
dp[0][2] = houses[0][2]
for i in 1..<N {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + houses[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + houses[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + houses[i][2]
}

print(min(dp[N-1][0], dp[N-1][1], dp[N-1][2]))
