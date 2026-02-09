let N = Int(readLine()!)!
// 이전 끝-다음 시작 비교 
// 이전 끝이 더 크다면, 이전 끝-다음 끝 비교. -> 만약 다음 끝이 이전 끝보다 더 작다면 교체. 아니라면 그대로
// 이전 끝이 같거나 더 작다면, 채택

var times: [(Int, Int)] = []
for _ in 0..<N {
    let time = readLine()!.split{$0==" "}.map{Int(String($0))!}
    times.append((time[0], time[1]))
}

times.sort{$0 < $1}

var current = times[0]
var count = 1

for i in 1..<times.count {
    var next = times[i]
    if next.0 >= current.1 {
        current = next
        count += 1
    } else if next.1 < current.1 {
        current = next
    }
}

print(count)


