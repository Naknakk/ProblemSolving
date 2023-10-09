let T = Int(readLine()!)!
var dataSheet: [(Int, Int)] = Array(repeating: (0, 0), count: 41)
dataSheet[0] = (1, 0)
dataSheet[1] = (0, 1)

func fibonacci(n: Int) -> (Int, Int) {
    if dataSheet[n] == (0, 0) {
        dataSheet[n] = (
            (fibonacci(n: n-2).0 + fibonacci(n: n-1).0),
            (fibonacci(n: n-2).1 + fibonacci(n: n-1).1)
        )
    }
    return dataSheet[n]
}
for _ in 0..<T {
    let input = Int(readLine()!)!
    let result = fibonacci(n: input)
    
    print("\(result.0) \(result.1)")
}