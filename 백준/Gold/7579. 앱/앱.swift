let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
// N: 현재 활성화된 앱
// M: 확보해야 하는 최소 바이트
let N = NM[0], M = NM[1]
let memories: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let costs: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}

// 비용 별 최대 메모리 ..? 구해볼까?
let maxCost = costs.reduce(0, +)
var dp: [Int] = Array(repeating: 0, count: maxCost+1)

for i in 0..<N {
    let cost = costs[i]
    let memory = memories[i]
    for j in stride(from: maxCost, through: cost, by: -1) {
        dp[j] = max(dp[j-cost]+memory, dp[j])
    }
}

for cost in 0..<maxCost+1 {
    if dp[cost] >= M {
        print(cost)
        break
    }
}


