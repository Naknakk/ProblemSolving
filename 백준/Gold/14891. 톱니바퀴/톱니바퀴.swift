var gears: [[Int]] = []
var pointers: [[Int]] = Array(repeating: [6, 2], count: 4)

for _ in 0..<4 {
    gears.append(Array(readLine()!).map{Int(String($0))!})
}

let K = Int(readLine()!)!
var turns: [(Int, Int)] = []

for _ in 0..<K {
    let turn = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    turns.append((turn[0]-1, turn[1]))
}

func isConnected(a: Int, b: Int) -> Bool {
    if abs(a-b) >= 2 { return false }
    if a == b { return false }
    let aPointer = pointers[a]
    let bPointer = pointers[b]
    
    if a > b && gears[b][bPointer[1]] != gears[a][aPointer[0]] {
        return true
    } else if a < b && gears[a][aPointer[1]] != gears[b][bPointer[0]] {
        return true
    } else {
        return false
    }
}

let dx = [-1, 1]

for turn in turns {
    var visit: [Bool] = Array(repeating: false, count: 4)
    var queue: [(Int, Int)] = [turn]
    visit[turn.0] = true
    var index = 0
    
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for i in 0..<2 {
            let next = (cur.0 + dx[i], cur.1 * -1)
            
            if next.0<0 || next.0>3 {
                continue
            } 
            
            if !visit[next.0] && isConnected(a: cur.0, b: next.0) {
                queue.append(next)
                visit[next.0] = true
            }
        }
    }
    
    for i in 0..<queue.count {
        let cur = queue[i]
        var pointer = pointers[cur.0]
        pointers[cur.0] = pointer.map { (($0-cur.1)+8)%8 }
    }
}

var value = [1, 2, 4, 8]
var ans = 0
for i in 0..<4 {
    let pointer = pointers[i]
    let top = ((pointer[1]-2)+8)%8
    ans += gears[i][top]*value[i]
}

print(ans)