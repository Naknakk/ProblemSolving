var N = Int(readLine()!)!
var count = 0

while N > 0 {
    var target = N
    while target % 5 == 0 {
            target /= 5
            count += 1
    }
    
    N -= 1
}
print(count)