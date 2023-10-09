let N = Int(readLine()!)!
let numbers = readLine()!.split{$0 == " "}.map{Int(String($0))!}.sorted()

let M = Int(readLine()!)!
let testCases = readLine()!.split{$0 == " "}.map{Int(String($0))!}

func binarySearch(of testNumber: Int) -> Int {
    var loIndex = -1
    var hiIndex = N
    
    while loIndex + 1 < hiIndex {
        let midIndex = (loIndex+hiIndex)/2
        
        if testNumber <= numbers[midIndex] {
            hiIndex = midIndex
        } else {
            loIndex = midIndex
        }
    }
    
    if loIndex == N-1 {
        return 0
    } else {
        return numbers[hiIndex] == testNumber ? 1 : 0
    }
}

for testCase in testCases {
    print(binarySearch(of: testCase))
}