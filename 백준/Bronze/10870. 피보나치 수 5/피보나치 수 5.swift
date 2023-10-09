func fibonacci(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
}
print(fibonacci(n: Int(readLine()!)!))