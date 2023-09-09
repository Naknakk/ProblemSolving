var count = 0
func move(from: Int, to: Int) -> String {
    return "\(from) \(to)\n"
}
func moveSet(N: Int, from: Int, to: Int) -> String {
    var str = ""
    if N == 1 {
        str += move(from: from, to: to)
        count += 1
        return str
    } else {
        var remainder = 6 - from - to
        str = moveSet(N: N-1, from: from, to: remainder)
            + move(from: from, to: to)
            + moveSet(N: N-1, from: remainder, to: to)
        count += 1
        return str
    }
}
let sol = moveSet(N: Int(readLine()!)!, from: 1, to: 3)
print(count)
print(sol)