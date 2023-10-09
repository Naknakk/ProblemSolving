let N = Int(readLine()!)!
var paper = Array(repeating: [0], count: N)
for i in 0..<N {
    paper[i] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
}

let white = 0
let blue = 1
let not = 2

var count = [0, 0]

func colorCheck(_ paper: [[Int]], _ n: Int) -> Int {
    let first = paper[0][0]

    for row in 0..<n {
        for slice in paper[row] {
            if slice != first {
                return not
            }
        }
    }
    
    return first
}

func cut(_ paper: [[Int]], _ n: Int) -> [[[Int]]] {
    var ranges = [(0, 0), (0, 1), (1, 0), (1, 1)]
    var result: [[[Int]]] = []
    for r in ranges {
        var a: [[Int]] = []
        for row in (r.0)*n/2..<(r.0+1)*n/2 {
            a.append(Array(paper[row][(r.1)*n/2..<(r.1+1)*n/2]))
        }
        result.append(a)
    }
    return result
}

func colorCount(paper: [[Int]]) {
    let n = paper.count
    let color = colorCheck(paper, n)
    
    if color != not {
        count[color] += 1
    } else {
        for piece in cut(paper, n) {
            colorCount(paper: piece)
        }
    }
}

colorCount(paper: paper)

for i in count {
    print(i)    
}