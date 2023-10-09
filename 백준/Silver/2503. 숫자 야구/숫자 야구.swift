let N = Int(readLine()!)!
var numbers = Array(repeating: [0, 0, 0], count: N)
var data = Array(repeating: [0, 0], count: N)
for i in 0..<N {
    var input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    data[i] = [input[1], input[2]]
    
    var number = [0, 0, 0]
    for j in 0..<3 {
        number[2-j] = input[0]%10
        input[0] /= 10
    }
    
    numbers[i] = number
}

func check(_ a: [Int]) -> Bool {
    var isOk = true
    
    for i in 0..<N {
        var result = [0, 0]
    
        for j in 0..<3 {
            if a[j] == numbers[i][j] {
                result[0] += 1
            } else if numbers[i].contains(a[j]) {
                result[1] += 1
            }
        }
        
        if result != data[i] {
            isOk = false
            break
        }
        
    }
    return isOk
}

var count = 0

for i in 1...9 {
    for j in 1...9 where j != i{
        for k in 1...9 where k != i && k != j {
            if check([i, j, k]) {
                count += 1
            }
        }
    }
}
print(count)