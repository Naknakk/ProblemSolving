let N = Int(readLine()!)!
var input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
input.sort(by: <)
var result = 0
for i in 0..<N {
    result += input[i]*(N-i)
}
print(result)