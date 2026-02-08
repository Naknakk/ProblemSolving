let NM = readLine()!.split{$0 == " "}.map{ Int(String($0))!}
let N = NM[0]
let M = NM[1]
var A: [Int] = []

for _ in 0..<N {
    A.append(Int(readLine()!)!)
}

A = A.sorted(by: <)

var st = 0
var en = 0
var ans = Int.max
while st < N && en < N {
    let diff = A[en] - A[st]
    if diff < M {
        en += 1
    } else {
        if diff < ans { ans = diff }
        st += 1
    }
    
    if ans == M { break }
}

print(ans)