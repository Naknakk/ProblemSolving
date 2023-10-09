let NK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NK[0], K = NK[1]
let line = Array(repeating: 0, count: N)
var lectures = Array(repeating: line, count: 3)

for i in 0..<N {
    let powers = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    lectures[0][i] = powers[0] + powers[1]
    lectures[1][i] = powers[1] + powers[2]
    lectures[2][i] = powers[2] + powers[0]
}
for i in 0..<3 {
    lectures[i].sort(by: >)
}
var sum = [0, 0, 0]
for i in 0..<K {
    for j in 0..<3 {
        sum[j] += lectures[j][i]
    }
}
print(sum.max()!)
