let HW1 = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let H1 = HW1[0], W1 = HW1[1]
var totalCoin = 0
var now: [[Character]] = []
for i in 0..<H1 {
    now.append(Array(readLine()!))
    for cor in now[i] {
        if cor == "O" {
            totalCoin += 1
        }
    }
}

let HW2 = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let H2 = HW2[0], W2 = HW2[1]
var target: [[Character]] = []
for _ in 0..<H2 {
    target.append(Array(readLine()!))
}
var line = Array(repeating: Character("."), count: W2*2+W1-2)
var field = Array(repeating: line, count: H2*2+H1-2)

for r in 0..<H1 {
    for c in 0..<W1 {
        field[H2-1+r][W2-1+c] = now[r][c]
    }
}

func check(sr: Int, sc: Int) -> Int {
    var count = 0
    for r in 0..<H2 {
        for c in 0..<W2 {
            if field[sr+r][sc+c] == "." {
                continue
            } else if target[r][c] == field[sr+r][sc+c] {
                count += 1
            }
        }
    }
    return totalCoin - count
}
var least = totalCoin

Outer: for r in 0..<H2+H1-1 {
    for c in 0..<W2+W1-1 {
        let moveCoin = check(sr: r, sc: c)
        if moveCoin == 0 {
            least = moveCoin
            break Outer
        } else if least > moveCoin {
            least = moveCoin
        }
    }
}
print(least)
