let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])
var output = ""
var remainders = Array(repeating: true, count: N)

func NnM(current: String, level: Int) {
    if level == M {
        for i in 0..<N {
            if remainders[i] {
                output += "\(current)\(i+1)\n"
            } 
        }
    }
    for i in 0..<N {
        if remainders[i] {
            remainders[i] = false
            NnM(current: "\(current)\(i+1) ", level: level+1)
            remainders[i] = true
        } 
    }
}

NnM(current: "", level: 1)
print(output)