let N = Int(readLine()!)!
var numbers = Array(repeating: 0, count: N)
for i in 0..<N {
    numbers[i] = Int(readLine()!)!
}
for i in 0..<N {
    var smallest = i
    for j in (i+1)..<N {
        smallest = numbers[smallest] > numbers[j] ? j : smallest       
    }
    numbers.swapAt(i, smallest)
}
for number in numbers {
    print(number)
}