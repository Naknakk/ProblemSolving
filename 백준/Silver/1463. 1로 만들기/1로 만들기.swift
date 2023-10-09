let N = Int(readLine()!)!
func makeOneCount(_ n: Int) -> Int {
    if n < 2 {
        return 0
    } else {
        let a = makeOneCount(n/3)+n%3
        let b = makeOneCount(n/2)+n%2
        return 1 + min(a, b)
    }
}
print(makeOneCount(N))
