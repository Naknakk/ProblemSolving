let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let (xRange, yRange) = (0...(M-8), 0...(N-8))

var board: [[Character]] = []
for i in 0..<N {
    board.append(Array(readLine()!))
}

func toggle(_ check: Character) -> Character {
    if check == "W" {
        return "B"
    } else {
        return "W"
    }
}
func counter(_ i: Int, _ j: Int) -> Int {
    var (countW, countB) = (0, 0)
    var check: Character = "B"
    for y in i..<(i+8) {
        check = toggle(check)
        for x in j..<(j+8) {
            if board[y][x] != check {
                countW += 1
            }else {
                countB += 1
            }
            check = toggle(check)
        }
    }
    return countW > countB ? countB : countW
}
var result = 64
for i in yRange {
    for j in xRange {
        var now = counter(i, j)
        if result > now {
            result = now
        }
    }
}
print(result)
