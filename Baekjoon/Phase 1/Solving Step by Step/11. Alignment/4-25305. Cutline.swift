let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, k) = (input[0], input[1])
var scores = readLine()!.split{$0 == " "}.map{Int(String($0))!}
scores.sort(by: >)
print(scores[k-1])