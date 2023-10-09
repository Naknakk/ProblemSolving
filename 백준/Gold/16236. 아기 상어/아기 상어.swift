let N = Int(readLine()!)!
var map = Array(repeating: [(0, 0, 0)], count: N)
for i in 0..<N {
    map[i] = readLine()!.split{$0 == " "}.map{(Int(String($0))!, 0, 0)}
}

var queue: [(Int, Int)] = []
var pointer = 0
var dr = [-1, 0, 0, 1]
var dc = [0, -1, 1, 0]
var size = 2
var eat = 0
var visitN = 1
var move = 0
var level = 0
var eats: [(Int, Int)] = []

OUTER: for r in 0..<N {
    for c in 0..<N {
        if map[r][c] == (9, 0, 0) {
            queue.append((r, c))
            map[r][c] = (0, 1, 0)
            break OUTER
        }
    }
}

func eat(_ n: (Int, Int)) {
    visitN += 1
    eat += 1
    move = map[n.0][n.1].2
    
    map[n.0][n.1] = (0, visitN, map[n.0][n.1].2)
    
    if size == eat {
        size += 1
        eat = 0
    }
    queue.append(n)
    pointer = queue.count-1
}

func select(_ inputs: [(Int, Int)]) -> (Int, Int) {
    var r = N
    var c = N
    
    for eat in inputs {
        if eat.0 < r {
            r = eat.0
            c = eat.1
        } else if eat.0 == r && eat.1 < c {
            c = eat.1
        }
    }
    eats.removeAll()
    
    return (r, c)
}

while pointer < queue.count {
    
    let cur = queue[pointer]

    if level != map[cur.0][cur.1].2  {
        if !eats.isEmpty {
            let nextEat = select(eats)
            eat(nextEat)
            continue
        }
        level += 1
    }
    
    for i in 0..<4 {
        let nr = cur.0+dr[i]
        let nc = cur.1+dc[i]
        
        if nr>N-1 || nr<0 || nc>N-1 || nc<0 {
            continue
        }
        
        if map[nr][nc].1 < visitN && map[nr][nc].0 <= size {
            map[nr][nc].1 = visitN
            map[nr][nc].2 = map[cur.0][cur.1].2 + 1
            queue.append((nr, nc))
            
            if map[nr][nc].0 != 0 && map[nr][nc].0 < size {
                eats.append((nr, nc))
            }
        }
    }
    pointer += 1
}
print(move)
