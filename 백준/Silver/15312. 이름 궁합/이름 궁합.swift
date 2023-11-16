let A = Array(readLine()!).map{String($0)}
let B = Array(readLine()!).map{String($0)}
let offset = 65
let counts: [Int] = [3, 2, 1, 2, 3, 3, 2, 3, 3, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 2, 2, 1]
var numbers: [Int] = []

for i in 0..<A.count {
    let countOfA = counts[Int(UnicodeScalar(A[i])!.value) - offset]
    let countOfB = counts[Int(UnicodeScalar(B[i])!.value) - offset]
    numbers.append(countOfA)
    numbers.append(countOfB)
}

while numbers.count > 2 {
    for i in 0..<numbers.count-1 {
        numbers[i] = (numbers[i]+numbers[i+1])%10
    }
    numbers.removeLast()
}

print("\(numbers[0])\(numbers[1])")