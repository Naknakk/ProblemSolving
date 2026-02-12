let input = readLine()!
var numbers = input.split{$0 == "-" || $0 == "+"}.map{Int(String($0))!}
var operators = input.filter{$0 == "-" || $0 == "+"}.map{String($0)}
let firstMinus: Int = operators.firstIndex{$0 == "-"} ?? numbers.count

var sum = numbers[0]
for i in 1..<numbers.count {
    if i <= firstMinus {
        sum += numbers[i]
    } else {
        sum -= numbers[i]
    }
}

print(sum)