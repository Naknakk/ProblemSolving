import Foundation
let N = Int(readLine()!)!
var numbers = Array(repeating: 0, count: N)
for i in 0..<N {
    numbers[i] = Int(readLine()!)!
}
var limit = 4000
var countings = Array(repeating: 0, count: (limit*2+1))
for i in 0..<N {
    countings[numbers[i]+4000] += 1
}
func getAverage(_ N: Int, _ numbers: [Int], _ countings: [Int]) -> Int {
    var sum = 0
    for i in 0...(limit*2) {
        sum += countings[i]*(i-4000)
    }
    let average: Double = Double(sum) / Double(N)
    return Int(round(average))
}
func getMode(_ N: Int, _ numbers: [Int], _ countings: [Int]) -> Int {
    let modeNumber = countings.max()!
    var modeCounter = 0
    var modeNumbers: [Int] = []
    for i in 0...(limit*2) {
        if modeNumber == countings[i] {
            modeCounter += 1
            modeNumbers.append(i-4000)
        }
    }
    
    if modeCounter != 1 {
        return modeNumbers[1]
    } else {
        return modeNumbers[0]
    }
}
func getMedianAndRange(_ N: Int, _ numbers: [Int], _ countings: [Int]) -> (Int, Int)
{
    var countingSums = countings
    for i in 1...(limit*2) {
        countingSums[i] = countingSums[i-1] + countingSums[i]
    }
    var sortedNumbers = Array(repeating: 0, count: N)
    for i in 0..<N {
        sortedNumbers[countingSums[numbers[i]+4000]-1] = numbers[i]
        countingSums[numbers[i]+4000] -= 1
    }
    let medianIndex = N/2
    return (sortedNumbers[medianIndex], sortedNumbers[N-1] - sortedNumbers[0])
}
let average = getAverage(N, numbers, countings)
let mode = getMode(N, numbers, countings)
let (median, range) = getMedianAndRange(N, numbers, countings)
print(average)
print(median)
print(mode)
print(range)