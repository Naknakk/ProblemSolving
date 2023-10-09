var a = Int(readLine()!)!
var b = Array(readLine()!).map{Int(String($0))!}

let first = a * b[2]
let second = a * b[1]
let third = a * b[0]

print(first)
print(second)
print(third)
print(first + second * 10 + third * 100)