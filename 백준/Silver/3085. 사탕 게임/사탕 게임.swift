let N = Int(readLine()!)!
var candyBoard = Array(repeating: [Character("s")], count: N)
for i in 0..<N {
    candyBoard[i] = Array(readLine()!)
}
var max = 1



func rowCheck(r: Int) {
    var count = 1
    var color = candyBoard[r][0]
    
    for c in 1..<N {
        if color == candyBoard[r][c] {
            count += 1
            if count > max {
                max = count
            }
        } else {
            color = candyBoard[r][c]
            count = 1
        }
    }
}

func columnCheck(c: Int) {
    var count = 1
    var color = candyBoard[0][c]
    
    for r in 1..<N {
        if color == candyBoard[r][c] {
            count += 1
            if count > max {
                max = count
            }
        } else {
            color = candyBoard[r][c]
            count = 1
        }
    }
}

func rSwapCheck(r: Int, c: Int) {
    let aColor = candyBoard[r][c]
    let bColor = candyBoard[r+1][c]
    
    if aColor != bColor {
        candyBoard[r][c] = bColor
        candyBoard[r+1][c] = aColor
        
        rowCheck(r: r)
        rowCheck(r: r+1)
        columnCheck(c: c)
        
        candyBoard[r][c] = aColor
        candyBoard[r+1][c] = bColor
    }
}

func cSwapCheck(r: Int, c: Int) {
    let aColor = candyBoard[r][c]
    let bColor = candyBoard[r][c+1]
    
    if aColor != bColor {
        candyBoard[r][c] = bColor
        candyBoard[r][c+1] = aColor
        
        columnCheck(c: c)
        columnCheck(c: c+1)
        rowCheck(r: r)
        
        candyBoard[r][c] = aColor
        candyBoard[r][c+1] = bColor
    }
}

for r in 0..<N {
    rowCheck(r: r)
    columnCheck(c: r)
    
    for c in 0..<N {
        if r != N-1 {
            rSwapCheck(r: r, c: c)
        }
        if c != N-1 {
            cSwapCheck(r: r, c: c)
        }
    }
}

print(max)