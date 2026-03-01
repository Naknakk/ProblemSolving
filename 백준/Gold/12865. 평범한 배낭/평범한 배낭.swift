let NK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NK[0], K = NK[1]
var things: [(weight: Int, value: Int)] = []

for _ in 0..<N {
    let thing = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    things.append((thing[0], thing[1]))
}

var dp: [Int] = Array(repeating: 0, count: K+1)

for thing in things {
    for i in 0..<K+1 {
        let index = K-i
        if index-thing.weight < 0 {continue}
        dp[index] = max(dp[index], dp[index-thing.weight] + thing.value)
    }
}

print(dp[K])