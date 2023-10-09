let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (NM[0], NM[1])
let numbers = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var prefixSums = Array(repeating: 0, count: N+1)
for i in 1...N {
    prefixSums[i] = prefixSums[i-1] + numbers[i-1]
}

var result = ""

for _ in 0..<M {
    let ij = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    result += "\(prefixSums[ij[1]]-prefixSums[ij[0]-1])\n"
}
print(result)