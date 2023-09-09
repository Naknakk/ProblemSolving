var N = Int(String(readLine()!))!
let numbers = Array(readLine()!).map{Int(String($0))!}

var result = 0
for number in numbers {
    result += number
}
print(result)