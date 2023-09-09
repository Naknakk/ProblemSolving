func Factorial(N: Int) -> Int {
    if N == 0 {
        return 1
    } else {
        return N * Factorial(N: N-1)
    }
}
print(Factorial(N: Int(readLine()!)!))