var input = 1
for _ in 1...3 {
    input *= Int(String(readLine()!))!
}
var count = Array(repeating: 0, count: 10)

while input > 0 {
    let index = input%10
    count[index] += 1
    input = input / 10
}

for n in count {
    print(n)
}