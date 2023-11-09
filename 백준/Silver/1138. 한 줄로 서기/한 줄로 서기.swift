let N = Int(readLine()!)!

var data: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var line: [Int] = Array(repeating: N+1, count: N)

for i in 0..<N {
    var count = -1
    var index = 0
    
    while count < data[i] {
        if line[index] > i {
            count += 1
        }
        index += 1
    }
    
    line[index-1] = i+1
}

var result = ""
for i in 0..<N {
    result += "\(line[i]) "
}
print(result)
