let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]
var map = Array(repeating: Array(repeating: 0, count: M), count: N)
for i in 0..<N {
    map[i] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
}

var cctvs: [(Int, Int)] = []
var count0 = 0
for r in 0..<N {
    for c in 0..<M {
        if map[r][c] == 0 {
            count0 += 1
        } else if map[r][c] != 6 {
            cctvs.append((r, c))
        }
    }
}
var blindSpots = count0

let stepSet = [1: (-1, 0), 2: (0, 1), 3: (1, 0), 4: (0, -1)]
let cctvInfos = [
    1: [[1], [2], [3], [4]],
    2: [[1, 3], [2, 4]],
    3: [[1, 2], [2, 3], [3, 4], [4, 1]],
    4: [[1, 2, 3], [2, 3, 4], [3, 4, 1], [4, 1, 2]],
    5: [[1, 2, 3, 4]]
]


func oneDirectionCheck(direction: Int, rc: (Int, Int)) -> Int {
    let step = stepSet[direction]!
    var change = 0
    var r = rc.0, c = rc.1
    
    while true {
        r += step.0
        c += step.1
        
        if r>N-1 || r<0 || c>M-1 || c<0 {
            break
        } else if map[r][c] == 0 {
            map[r][c] = 7
            change += 1
        } else if map[r][c] == 6 {
            break
        } else {
            continue
        }
    }
    
    return change
}

func check(directions: [Int], rc: (Int, Int)) -> Int {
    var change = 0
    for direction in directions {
        change += oneDirectionCheck(direction: direction, rc: rc)
    }
    return change
}

func test(level: Int, last: Int) -> Bool{
    if last == 0 {
        blindSpots = 0
        return true
    } else if level == cctvs.count {
        blindSpots = blindSpots > last ? last : blindSpots
        return false
    }
    let cur = cctvs[level], cctv = map[cur.0][cur.1]
    let cctvInfo = cctvInfos[cctv]!
    
    let undoMap = map
    
    for directions in cctvInfo {
        let checkCnt = check(directions: directions, rc: cur)
        if test(level: level+1, last: last-checkCnt) {
            return true
        }
        map = undoMap
         
    }
    return false
}

_ = test(level: 0, last: count0)
print(blindSpots)