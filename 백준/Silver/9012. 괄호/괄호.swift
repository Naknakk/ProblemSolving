let T = Int(readLine()!)!
for _ in 0..<T {
    let input = readLine()!
    var stack = 0 
    for i in input {
        if i == "(" {
            stack += 1
        } else {
            stack -= 1
        }
        if stack < 0 {
            break
        }
    }
    print(stack == 0 ? "YES" : "NO")
}