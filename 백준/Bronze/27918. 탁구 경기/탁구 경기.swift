let N = Int(readLine()!)!

var results = Array(repeating: "", count: N)
for i in 0..<N {
    results[i] = readLine()!
}

var X = 0, Y = 0

for i in 0..<N {
    if abs(X-Y) == 2 {
        break
    }
    
    if results[i] == "D" {
        X += 1
    } else {
        Y += 1
    }
}
print("\(X):\(Y)")
