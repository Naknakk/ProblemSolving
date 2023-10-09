func inputToArray(of input: Int) -> [Int] {
    var N = input
    var result: [Int] = []
    while N > 0 {
        result.append(N%10)
        N /= 10
    }
    return result
}

func checkNumber(of input: [Int]) -> Bool{
    var flag = true
    var difference: Set<Int> = []
    var numbers = input
    var nowNumber = 0
    var nextNumber = 0
    
    while numbers.count > 1 {
        nowNumber = numbers.removeFirst()
        nextNumber = numbers[0]
        
        difference.insert(nowNumber - nextNumber)
    }
    
    if difference.count <= 1 {
        flag = true
    } else {
        flag = false
    }
    return flag
}

var N = Int(String(readLine()!))!
var count = 0
while N > 0 {
    if checkNumber(of: inputToArray(of: N)) {
        count += 1
    }
    N -= 1
    
}
print(count)