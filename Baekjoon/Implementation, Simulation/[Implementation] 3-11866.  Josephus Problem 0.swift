let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, K): (Int, Int) = (input[0], input[1])

var circle: [Int] = Array(repeating: 1, count: N)
var pointer = -1   // 첫 시작시, 첫번째 부터 카운팅하므로 -1에서 포인터를 시작한다.
var result: [Int] = []

func moveAndCheck() -> Bool {  // 포인터를 옮기고, 자리에 사람이 있는지 체크하는 것
    pointer = pointer == N-1 ? 0 : (pointer+1)
    return circle[pointer] == 1
}
for _ in 0..<N {
    var counter = 0
    while true {    // 계속 돌며 사람을 만날 때마다 카운터를 올린다.
        counter = moveAndCheck() ? counter+1 : counter
        if counter == K {
            break;
        }
    }
    result.append(pointer+1)  // 0~6을 1~7으로 바꿔준다.
    circle[pointer] = 0
}

// 출력 양식을 위한 부분.
var output = "<"
for i in result {
    output += "\(i), "
}
output.removeLast(2)
output += ">"
print(output)
