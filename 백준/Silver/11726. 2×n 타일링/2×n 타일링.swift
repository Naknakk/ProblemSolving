let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 2

func tiling(n: Int) -> Int {
    if dp[n] != 0 {
        return dp[n]
    }
    dp[n] = (tiling(n: n-2) + tiling(n: n-1))%10007
    return dp[n]
}

print(tiling(n: N))