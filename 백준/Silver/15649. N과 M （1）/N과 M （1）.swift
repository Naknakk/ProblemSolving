// recursion without global var
let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])

func NnM(current: String, remainders: [Bool], level: Int) {
    if level == M {
        for i in 0..<N {
            if remainders[i] {
                print("\(current)\(i+1)")
            } 
        }
    }
    for i in 0..<N {
        if remainders[i] {
            var next = remainders
            next[i] = false
            NnM(current: "\(current)\(i+1) ", remainders: next, level: level+1)
        } 
    }
}
let remainders = Array(repeating: true, count: N)
NnM(current: "", remainders: remainders, level: 1)