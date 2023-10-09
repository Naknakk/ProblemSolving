let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 11)
dp[1] = 1
dp[2] = 2
dp[3] = 4
func sum123(n: Int) -> Int {
    if dp[n] != 0 {
        return dp[n]
    }
    dp[n] = sum123(n: n-3) + sum123(n: n-2) + sum123(n: n-1)
    return dp[n]
}

for _ in 0..<T {
    let input = Int(readLine()!)!
    print(sum123(n: input))
}