let computerNumber = Int(readLine()!)!
var infections = Array(repeating: false, count: computerNumber)
infections[0] = true

let connectNumber = Int(readLine()!)!
var connections: [[Int]] = Array(repeating: [], count: computerNumber)
for i in 0..<connectNumber {
    let connection = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
    connections[connection[0]].append(connection[1])
    connections[connection[1]].append(connection[0])
}

var queue: [Int] = [0]
var pointer = 0

while pointer < queue.count {
    let cur = queue[pointer]
   
    for next in connections[cur] {
        if !infections[next] {
            infections[next] = true
            queue.append(next)
        }
    }
    pointer += 1
}

print(queue.count-1)