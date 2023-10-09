import Foundation

// 에라토스테네스의 체
let maxNumber = 123456*2
var numbers = Array(repeating: true, count: maxNumber+1)
numbers[0] = false
numbers[1] = false
let rootmaxNumber = Int(Double(maxNumber).squareRoot() + 1)

for i in 0...rootmaxNumber {
    if numbers[i] {
        var n = i * 2
        while n <= maxNumber {
            numbers[n] = false
            n += i
        }        
    }
}

while true {
    let input = Int(readLine()!)!
    if input == 0 {
        break
    }
    let (min, max) = (input+1, input*2)
    var count = 0
    for index in min...max {
        if numbers[index] {
        count += 1
        }
    }
    print(count)
}
