let N = Int(String(readLine()!))!

var T = N
var cycle = 0

repeat {
    var sum = 0
    if T < 10 {
        sum = T
    } else {
        sum = T/10 + T%10
    }
    T = (T%10) * 10 + sum%10
    cycle += 1
} while N != T

print(cycle)