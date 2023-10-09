import Foundation
let inputs = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (min, max) = (inputs[0], inputs[1])

let maxNumber = 1000000
var numbers = Array(repeating: true, count: maxNumber+1)
numbers[0] = false
numbers[1] = false

// 에라토스테네스의 체
for i in 0...1000 {
    if numbers[i] {
        var n = i * 2
        while n <= maxNumber {
            numbers[n] = false
            n += i
        }        
    }
}

for index in min...max {
    if numbers[index] {
        print(index)
    }
}