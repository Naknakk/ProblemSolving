var input = 1
for _ in 1...3 {
    input *= Int(String(readLine()!))!
}

let result = Array(String(input))
var count = Array(repeating: 0, count: 10)
for n in result {
    let N = Int(String(n))!
    for i in 0...9 {
        if i == N {
            count[i] += 1
        }
    }
}

for n in count {
    print(n)
}