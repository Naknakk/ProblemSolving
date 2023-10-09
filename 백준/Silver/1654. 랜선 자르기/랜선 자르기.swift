let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (K, N) = (input[0], input[1])
var lengths: [Int] = []


for _ in 0..<K {
    lengths.append(Int(readLine()!)!)
}

var hiLength: Int = lengths.max()! + 1
var loLength: Int = 0

while loLength + 1 < hiLength {
    let midLength = (loLength + hiLength) / 2
    var testN = 0
    
    for length in lengths {
        testN += (length / midLength)
    }
    if testN < N {
        hiLength = midLength
    } else {
        loLength = midLength
    }
}
print(loLength)