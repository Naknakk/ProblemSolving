let input = readLine()!.split{ $0 == " "}.map{ Int($0)! }

let Time = (input[0] * 60 + input[1] - 45) + 24 * 60

print("\((Time/60)%24) \(Time%60)")