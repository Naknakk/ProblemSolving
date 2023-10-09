let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, K): (Int, Int) = (input[0], input[1])

var map: [Int] = Array(repeating: -1, count: 100_001)
map[N] = 0
var current: [Int] = [N]
var pointer = 0

while true {
    let cur = current[pointer]
    
    for i in [cur-1, cur+1, cur*2] {
        if i > 100_000 || i < 0 || map[i] != -1 {
            continue
        }
        map[i] = map[cur] + 1
        current.append(i)
    }
    
    if map[K] != -1 {
        break
    } else {
        pointer += 1
    }
}
print(map[K])