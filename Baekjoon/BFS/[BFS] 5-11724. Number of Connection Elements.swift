let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M): (Int, Int) = (NM[0], NM[1])
var map = Array(repeating: 0, count: N)
var connections: [[Int]] = Array(repeating: [], count: N)

for i in 0..<M {
    let con = readLine()!.split{$0 == " "}.map{Int(String($0))!-1}
    connections[con[0]].append(con[1])  // 간선 저장시 양방향으로 저장 중요!
    connections[con[1]].append(con[0])
}

var blob = 0 // 각 블랍마다 번호로 칠해준다. 동시에 블랍의 갯수가 됨.

for i in 0..<N {
    if map[i] != 0 {
        continue
    }
    blob += 1
    map[i] = blob
    
    var current: [Int] = [i]
    var pointer = 0
    
        // count 써도 되고... curCounter 정수값으로 추적해도 된다. count도 시간 복잡도가 1이란다 /? 그냥 쓰자.
    while pointer < current.count {
        let cur = current[pointer]
        
        for next in connections[cur] {
            if map[next] == 0 {
                map[next] = blob
                current.append(next)
            }
        }
        pointer += 1
    }
}
print(blob)
