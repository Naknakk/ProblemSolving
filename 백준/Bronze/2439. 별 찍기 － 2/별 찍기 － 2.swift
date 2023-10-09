let N = Int(String(readLine()!))!

for i in 1...N {
    var str = ""
    let T = N - i
    
    for _ in 0...T {
        str += " "
    }
    
    for _ in 1...i {
        str += "*"
    }
    str.removeFirst()
    print(str)
}