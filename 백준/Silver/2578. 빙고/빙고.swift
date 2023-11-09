var map: [[Int]] = []
var calls: [Int] = []
for _ in 0..<5 {
    map.append(readLine()!.split{$0 == " "}.map{Int(String($0))!})
}
for _ in 0..<5 {
    calls += readLine()!.split{$0 == " "}.map{Int(String($0))!}
}

var rowSums: [Int] = Array(repeating: 0, count: 5)
var columnSums: [Int] = Array(repeating: 0, count: 5)
var diagSums: [Int] = Array(repeating: 0, count: 2)

for r in 0..<5 {
    for c in 0..<5 {
        if r == c {
            diagSums[0] += map[r][c]
        } else if r == (4-c) {
            diagSums[1] += map[r][c]
        }
        rowSums[r] += map[r][c]
        columnSums[c] += map[r][c]
    }
}


for i in 0..<25 {
    let index = getIndexOfNumber(of: calls[i])
    updateSums(of: index)
    if checkBingo() {
        print(i+1)
        break
    }
    
}

func getIndexOfNumber(of number: Int) -> (Int, Int) {
    for i in 0..<5 {
        if let index = map[i].firstIndex(of: number) {
            return (i, index)
        }
    }
    
    return (-1, -1)
}

func updateSums(of index: (Int, Int)) {
    let r = index.0, c = index.1
    
    if r == c {
        diagSums[0] -= map[r][c]
    } else if r == (4-c) {
        diagSums[1] -= map[r][c]
    }
    rowSums[r] -= map[r][c]
    columnSums[c] -= map[r][c]
}

func checkBingo() -> Bool {
    var count = 0
    for i in 0..<5 {
        if rowSums[i] == 0 {
            count += 1
        }
        if columnSums[i] == 0 {
            count += 1
        }
    }
    
    for i in 0..<2 {
        if diagSums[i] == 0 {
            count += 1
        }
    }
    
    return count >= 3
}