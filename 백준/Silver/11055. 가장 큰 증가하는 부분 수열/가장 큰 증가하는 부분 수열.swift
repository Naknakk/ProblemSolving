let N = Int(readLine()!)!
var sequence: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var dp: [Int] = Array(repeating: 0, count: N)
dp[0] = sequence[0]

for i in 1..<N {
    var sum = 0
    for j in stride(from: i-1, through: 0, by: -1) {
        if sequence[j] < sequence[i] {
            sum = max(dp[j], sum)
        }
    }
    
    dp[i] = sum + sequence[i]
}
print(dp.max()!)