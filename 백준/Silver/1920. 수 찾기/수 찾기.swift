let N = Int(readLine()!)!
let numbers = Set(readLine()!.split{$0 == " "}.map{Int(String($0))!})

let M = Int(readLine()!)!
let testCases = readLine()!.split{$0 == " "}.map{Int(String($0))!}

for testCase in testCases {
    print(numbers.contains(testCase) ? "1" : "0")
}