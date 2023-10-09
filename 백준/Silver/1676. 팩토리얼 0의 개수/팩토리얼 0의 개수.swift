var N = Int(readLine()!)!
var count = [0, 0]

while N > 0 {
    var target = N
    var dividers = [2, 5]
    
    for i in 0..<2 {
        let divider = dividers[i]
        
        while target % divider == 0 {
            target /= divider
            count[i] += 1
        }
    }
    N -= 1
}
print(count.min()!)