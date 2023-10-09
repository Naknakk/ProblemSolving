let computerNumber = Int(readLine()!)!
var isInfection = Array(repeating: false, count: computerNumber)
isInfection[0] = true

let connectNumber = Int(readLine()!)!
var connections: [Int : [Int]] = [:]
for i in 0..<connectNumber {
    let connection = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
    connections[connection[0], default: []].append(connection[1])
    connections[connection[1], default: []].append(connection[0])
}

var queue: [Int] = [0]
var queueCounter = 1
var pointer = 0

while pointer != queueCounter {
    let cur = queue[pointer]
    
    for next in connections[cur] ?? [] {
        if isInfection[next] {
            continue
        } else {
            isInfection[next] = true
            queue.append(next)
            queueCounter += 1
        }
    }
    pointer += 1
}

print(queueCounter-1)