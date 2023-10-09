let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, K): (Int, Int) = (input[0], input[1])

var circle: [Int] = Array(repeating: 1, count: N)
var pointer = -1
var result: [Int] = []

func moveAndCheck() -> Bool {
    pointer = pointer == N-1 ? 0 : (pointer+1)
    return circle[pointer] == 1
}

for _ in 0..<N {
    var counter = 0
    while true {
        counter = moveAndCheck() ? counter+1 : counter
        if counter == K {
            break;
        }
    }
    result.append(pointer+1)
    circle[pointer] = 0
}

var output = "<"
for i in result {
    output += "\(i), "
}
output.removeLast(2)
output += ">"
print(output)