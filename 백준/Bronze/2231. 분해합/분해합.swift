func d(n: Int) -> Int {
    var input = n
    var result = n
    while input > 0 {
        result += (input%10)
        input /= 10
    }
    return result
}
let N = Int(readLine()!)!
var generator = 1

while generator <= N {
    if d(n: generator) == N {
        break
    } else {
        generator += 1
    }
}
if generator > N {
    print(0)
} else {
    print(generator)
}