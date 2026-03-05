let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]


var pointers: [Int] = Array(repeating: -1, count: N+1)
for i in 0..<N+1 {
    pointers[i] = i
}

func findRoot(index: Int) -> Int {
    if index == pointers[index] {
        return index
    } else { 
        let root = findRoot(index: pointers[index])
        pointers[index] = root
        return root
    }
}

func isSameSet(a: Int, b: Int) -> Bool {
    return findRoot(index: a) == findRoot(index: b)
}

for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let op = input[0], a = input[1], b = input[2]
    if op == 0 {
        let aRoot = findRoot(index: a)
        let bRoot = findRoot(index: b)
        pointers[aRoot] = bRoot
    } else if op == 1 {
        print(isSameSet(a: a, b: b) ? "YES" : "NO")
    }
}
