let NS = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, S) = (NS[0], NS[1])
var series = readLine()!.split{$0 == " "}.map{Int(String($0))!}

let used = Array(repeating: false, count: N)
var count = 0

func partSum(sum: Int, usedInfo: [Bool]) {
    var nextUsed = usedInfo
    if sum == S {
        count += 1
    }
    for i in 0..<N {
        if !usedInfo[i] {
            nextUsed[i] = true
            partSum(sum: sum+series[i], usedInfo: nextUsed)
        }
    }
}
if S == 0 {
    count -= 1
}

partSum(sum: 0, usedInfo: used)
print(count)