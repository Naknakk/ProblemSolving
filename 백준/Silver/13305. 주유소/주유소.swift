let N = Int(readLine()!)!
var distances = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var costs = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var minCost = Int.max
var totalCost: Int64 = 0

for i in 0..<N-1 {
    minCost = min(minCost, costs[i])
    totalCost += Int64(distances[i]*minCost)
}

print(totalCost)