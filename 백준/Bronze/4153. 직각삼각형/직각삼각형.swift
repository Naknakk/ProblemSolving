var testCases: [String] = []
var testCase = readLine()!

while testCase != "0 0 0" {
    testCases.append(testCase)
    testCase = readLine()!
}

func test(_ testCase: String) -> String {
    let testCaseInt: [Int] = testCase.split{$0 == " "}.map{Int(String($0))!}.sorted(by: <)
    let (a, b, c) = (testCaseInt[0], testCaseInt[1], testCaseInt[2])
    let test: Bool = (a*a + b*b == c*c)
    return test ? "right" : "wrong"
}

for testCase in testCases {
    print(test(testCase))
}