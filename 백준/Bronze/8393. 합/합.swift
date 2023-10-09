func sumFactorial (n: Int) -> Int {
    if n == 0 {
        return 0
    }
    
    return n + sumFactorial(n: n-1)
}

let n = Int(String(readLine()!))!

print(sumFactorial(n: n))