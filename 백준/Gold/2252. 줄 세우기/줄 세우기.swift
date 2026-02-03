let input = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
let N = input[0]
let M = input[1]

var edge: [[Int]] = Array(repeating: [], count: N+1)
var indegree: [Int] = Array(repeating: 0, count: N+1)

for _ in 0..<M {
    let result = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
    let A = result[0]
    let B = result[1]
    
    edge[A].append(B)
    indegree[B] += 1
}

var stack: [Int] = []
var result: [Int] = []

for i in 1..<N+1 {
    if indegree[i] == 0 {
        stack.append(i)
    }
}

while !stack.isEmpty {
    let current = stack.removeLast()
    result.append(current)
    
    for i in edge[current] {
        indegree[i] -= 1
        if indegree[i] == 0 {
            stack.append(i)
        }
    }
}

for i in result {
    print(i, terminator: " ")
}



