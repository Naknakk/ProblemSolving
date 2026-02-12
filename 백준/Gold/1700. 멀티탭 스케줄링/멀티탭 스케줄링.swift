let NK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NK[0]
let K = NK[1]
var sequence = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var current: Set<Int> = []
var ans = 0

for i in 0..<K {
    if current.count >= N && !current.contains(sequence[i]) {
        var remains = current
        for j in i..<K {
            remains.remove(sequence[j])
            if remains.count == 1 { break }
        }
        
        current.remove(remains.first!)
        ans += 1
    }
    current.insert(sequence[i])
}

print(ans)
