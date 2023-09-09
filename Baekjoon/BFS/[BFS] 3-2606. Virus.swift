// 각 변수/상수의 의미를 명확하게 하려고 길게 이름을 지어봤다.

let computerNumber = Int(readLine()!)!
var isInfection = Array(repeating: false, count: computerNumber)
isInfection[0] = true

let connectNumber = Int(readLine()!)!
var connections: [[Int]] = Array(repeating: [], count: computerNumber)
for i in 0..<connectNumber {
    let connection = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}  // 컴퓨터 번호는 1부터 시작해 0으로 맞춰주기
    connections[connection[0]].append(connection[1])   // 처음엔 이것만 해두었다가 틀렸다.
    connections[connection[1]].append(connection[0])
}

var queue: [Int] = [0]
var queueCounter = 1
var pointer = 0

while pointer != queueCounter {
    let cur = queue[pointer]
    
    for next in connections[cur] {
        if !isInfection[next] {
            isInfection[next] = true
            queue.append(next)
            queueCounter += 1
        }
    }
    pointer += 1
}

print(queueCounter-1) // 감염된 컴퓨터 중 1번 컴퓨터는 빼야한다. 그냥 pointer를 반환해도 되나 의미를 확실히 하기 위해 이렇게 두었다.
