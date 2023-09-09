// 1. BFS에 충실한 풀이(라고 생각한다.)
// 이전에 BFS를 풀기위해 큐 대신 스택을 사용한 방법 그대로 한 것.
// 거리가 1인 곳 우르르ㅡ, 2인 곳 우르르, 하며 계층을 따라 탐색하는 느낌으로 진행된다.
// 다만, 배열을 늘이고 줄이는 것이 많이 포함되어있다보니(next배열) 다음 방법에 비해 상대적으로 조금 느리다.(28ms)

let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, K): (Int, Int) = (input[0], input[1])

var map: [Int] = Array(repeating: -1, count: 100_001)
map[N] = 0
var current: [Int] = [N]
var next: [Int] = []
var distance: Int = 1

while !current.isEmpty {
        // 이번 문제에선 current에 많은 양이 쌓이므로, removeFirst()를 사용하면 많이 느려진다.(144ms)
    let cur = current.removeLast()
    
    for i in [cur-1, cur+1, cur*2] { // 원래 이 배열을 함수로 불러오도록 했는데, 그러면 속도가 느리다.
        if i > 100_000 || i < 0 || map[i] != -1 {
            continue
        }
        map[i] = distance
                // 이전에 next = [i] + next 로 두면 속도가 어떨까..? 했는데, 이번 문제에선 확실히 느려진다.(684ms)
        next += [i]
    }
    
    if current.isEmpty {
        current = next
        next = []
        distance += 1
    }
    
    if map[K] != -1 {
        break
    }
}
print(map[K])


// 2. BFS에 충실..한가? 배열을 하나만 써서 속도가 훨씬 빨라진다.(16ms)
// 큐를 못 쓰는 대신, pointer를 이용해 큐와 같은 효과를 만들어 준다. 팝을 하지 않고, pointer를 뒤로 옮기며
// 쌓인 것들로 이동해 준다. 종료 조건 역시 큐가 비었을 때가 아니라, pointer가 current 인덱스를 벗어나는 순간으로 잡는다.
// 사실 이번 문제같은 경우에는, K에 도달하는 순간 break를 두면 되므로, while true로 해두어도 문제없다.
// 무조건 답이 있음이 보장되는 백준이기 때문에 가능.
let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, K): (Int, Int) = (input[0], input[1])

var map: [Int] = Array(repeating: -1, count: 100_001)
map[N] = 0
var current: [Int] = [N]
var pointer = 0
var currentCounter = 1

while pointer != currentCounter { // current.count로 매번 비교하면 O(N)이므로, 따로 정수형 값을 추가해 비교해 주자.
    let cur = current[pointer]
    
    for i in [cur-1, cur+1, cur*2] {
        if i > 100_000 || i < 0 || map[i] != -1 {
            continue
        }
        map[i] = map[cur] + 1
        current.append(i)
        currentCounter += 1
    }
    
    if map[K] != -1 {
        break
    } else {
        pointer += 1
    }
}
print(map[K])
