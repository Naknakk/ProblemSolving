let NMK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NMK[0], M = NMK[1], K = NMK[2]
let line = Array(repeating: 0, count: M)
var noteBook: [[Int]] = Array(repeating: line, count: N)
var lastCnt = N*M
var stickers: [[[Int]]] = []
var stickersInfo: [(Int, Int)] = []
for _ in 0..<K {
    let RC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let R = RC[0], C = RC[1]
    stickersInfo.append((R, C))
    
    var sticker: [[Int]] = Array(repeating: [0], count: R)
    
    for r in 0..<R {
        sticker[r] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    }
    stickers.append(sticker)
}




func rotate(i: Int, rotation: Int) -> [[Int]] {
    let info = stickersInfo[i]
    
    if rotation == 0 {
        return stickers[i]
    }
    
    
    let rotationSet = [
    0: [(0, 0), (0, 1), (1, 0)],
    1: [(info.0-1, 0), (-1, 0), (info.0-1, 1)], 
    2: [(info.0-1, info.1-1), (0, -1), (-1, info.1-1)],
    3: [(0, info.1-1), (1, 0), (0, -1)]
    ]
    
    let rot = rotationSet[rotation]!
    var result: [[Int]] = []
    var line: [Int] = []
    var cur = rot[0]
    
    while !(cur.0<0 || cur.0>info.0-1 || cur.1<0 || cur.1>info.1-1) {
        
        line.append(stickers[i][cur.0][cur.1])
        
        cur.0 += rot[1].0
        cur.1 += rot[1].1
        
        if cur.0<0 || cur.0>info.0-1 || cur.1<0 || cur.1>info.1-1 {
            cur.0 = rot[1].0 != 0 ? rot[2].0 : rot[2].0+cur.0
            cur.1 = rot[1].1 != 0 ? rot[2].1 : rot[2].1+cur.1
            
            result.append(line)
            
            line = []
        }
    }
    
    return result
}

func check(target: [[Int]]) -> Int {
    let backup = noteBook
    let info = (target.count, target[0].count)
    var change = 0
    
    if info.0 > N || info.1 > M {
        return 0
    }
    
    largeLoop: for r in 0..<N-info.0+1 {
        for c in 0..<M-info.1+1 {
            
            smallLoop: for r1 in 0..<info.0 {
                for c1 in 0..<info.1 {
                    if target[r1][c1] == 1 && noteBook[r+r1][c+c1] == 0 {
                        noteBook[r+r1][c+c1] = 1
                        change += 1
                    } else if target[r1][c1] == 1 && noteBook[r+r1][c+c1] == 1 {
                        change = 0
                        noteBook = backup
                        break smallLoop
                    }
                }
            }
            
            if change != 0 {
                break largeLoop
            }
        }
    }
    return change
}

for i in 0..<K {
    let info = stickersInfo[i]
    var size = 0
    for r in 0..<info.0 {
        for c in 0..<info.1 {
            if stickers[i][r][c] == 1 {
                size += 1
            }
        }
    }
    
    if size > lastCnt {
        continue
    }
    
    RotateLoop: for rotation in 0..<4 {
        let target = rotate(i: i, rotation: rotation)
        let change = check(target: target)
        
        if change != 0 {
            lastCnt -= change
            break RotateLoop
        }
    }
}

print(N*M-lastCnt)