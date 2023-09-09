let variables = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (variables[0], variables[1])
var stringSet = Set<String>()

for _ in 0..<N {
    stringSet.insert(readLine()!)
}

var count = 0

for _ in 0..<M {
    if stringSet.contains(readLine()!) {
        count += 1
    }
}
print(count)