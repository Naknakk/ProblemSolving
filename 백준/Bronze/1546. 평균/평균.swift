let N = Double(String(readLine()!))!
let scores = readLine()!.split{$0 == " "}.map{Double(String($0))!}

let M = scores.max()!
var average: Double = 0

for score in scores {
    average += score / M * 100 / N
}
print(average)