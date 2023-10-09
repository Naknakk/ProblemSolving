var series: [Int] = []
var stack: [Int] = []
var answer: [String] = []
var count = 1
let n = Int(readLine()!)!

for _ in 0..<n {
    series.append(Int(readLine()!)!)
}

for index in 0..<n {
    let target = series[index]
    
    while target >= count {
        stack.append(count)
        answer.append("+")
        count += 1
    }
    
    if target == stack.last {
       _ = stack.popLast()
        answer.append("-")
    } else {
        answer = ["NO"]
        break
    }
}

for i in answer {
    print(i)
}