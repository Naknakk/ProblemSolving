let N = Int(readLine()!)!
var number = 666
var counter = 1
func check666(of number: Int) -> Bool {
    var digits: [Int] = []
    var input = number
    while input > 0 {
        digits.append(input % 10)
        input /= 10
    }
    var counter = 0
    for digit in digits {
        if digit == 6 {
            counter += 1
        } else {
            counter = 0
        }
        if counter == 3 {
            return true
        }
    }
    return false
}

while N != counter {
    number += 1
    if check666(of: number) {
        counter += 1
    }
}

print(number)