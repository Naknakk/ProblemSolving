let NK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var (N, K) = (NK[0], NK[1])

var coins = Array(repeating: 0, count: N)
for i in 0..<N {
    coins[i] = Int(readLine()!)!
}

var count = 0

for i in 1...N {
    count += (K/coins[N-i])
    K %= coins[N-i]
}
    
print(count)