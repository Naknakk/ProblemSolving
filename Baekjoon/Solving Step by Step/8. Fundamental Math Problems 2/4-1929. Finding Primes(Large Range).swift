import Foundation
let inputs = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (min, max) = (inputs[0], inputs[1])

let primes = Array(min...max).filter{$0 == 2 || $0%2 != 0}.filter{i in 
    let endpoint = Double(i).squareRoot() + 1
    return i != 1 && Array(1..<Int(endpoint)).filter{i%$0==0}.count == 1}

for prime in primes {
    print(prime)
}

// 위 코드로는 1868ms. 아래 코드는 36 ms

let input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [Bool](repeating: true, count: 1000001)
arr[1] = false
var cur = 2
for i in 2...1000 where arr[i] == true {
    for j in 2...1000000/i {
        arr[i*j] = false
    }
}
var ret = ""
for i in input[0]...input[1] {
    if arr[i] {
        ret += "\(i)\n"
    }
}
print(ret)

// 80ms 로 수정. 미리 소수를 구한 뒤 범위 내의 소수를 찾기
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