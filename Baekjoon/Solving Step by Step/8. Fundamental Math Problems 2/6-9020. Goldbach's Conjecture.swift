import Foundation

// 에라토스테네스의 체
func getPrimes(maxNumber: Int) -> [Bool] {
    var numbers = Array(repeating: true, count: maxNumber+1)
    numbers[0] = false
    numbers[1] = false
    let rootmaxNumber = Int(Double(maxNumber).squareRoot() + 1.0)

    for i in 0...rootmaxNumber {
        if numbers[i] {
            var n = i * 2
            while n <= maxNumber {
                numbers[n] = false
                n += i
            }        
        }
    }
    return numbers
}

var numbers = getPrimes(maxNumber: 10000)

var T = Int(readLine()!)!
Ounter: while T>0 {
    let input = Int(readLine()!)!
    Inner: for i in (input / 2)...input {
        if numbers[i] && numbers[input-i] {
            print("\(input-i) \(i)")
            break Inner
        }
    }
    T -= 1
}