let inputCount = Int(readLine()!)!

for _ in 0..<inputCount {
        // 입력 받기.
    var input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let (N, targetOrder) = (input[0], input[1])
    
        // 테스트 케이스의 큐를 입력받는데, 이때 target 문서의 위치를 현재 Que 내의 순서로 제시하므로
        // 우선순위와 함께 현재 Que 내의 순서를 같이 입력받아 저장해야 한다.
    var order = -1
    var currentQue: [(Int, Int)] = readLine()!.split{$0 == " "}.map{
        order += 1
        return (Int(String($0))!, order)
    }
    
        // 큐의 가장 앞 자료가 우선순위가 가장 높다면 출력하고, 아니라면 다시 처음으로 돌아가야 한다.
    // 따라서 매번 우선순위 비교가 필요한데, 이를 단순하게 하기 위해 우선순위별 자료 갯수를 저장해
        // 이 값과 비교하도록 하였다.
    var priorities = Array(repeating: 0, count: 10)
    for priority in currentQue {
        priorities[priority.0] += 1
    }
    
        // 이제 문제 그대로 반복하며 목표한 문서가 몇 번째로 인쇄되었는지 찾을 시간.
    // 조건문을 읽어보면 정말 문제 그대로 진행됨.
    var count = 0
    var lastQueCount = N
    
    while lastQueCount != 0 {
        let test = currentQue.removeFirst()
        if test.0 == priorities.lastIndex(where: {$0 != 0}) {
            count += 1
            priorities[test.0] -= 1
            lastQueCount -= 1
            if test.1 == targetOrder {
                print(count)
                break
            }
        } else {
            currentQue.append(test)
        }
    }
}
