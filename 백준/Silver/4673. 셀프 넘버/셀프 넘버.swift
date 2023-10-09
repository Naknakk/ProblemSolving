func d(_ input: Int) -> Int {
    var n = input
    var result = n
    while n > 0 {
        result += (n % 10)
        
        n /= 10
    }
    return result
}

func makeSeries(of input: Int) -> Set<Int> {
    var output = input
    var result: Set<Int> = []
    while output <= 10000 {
        result.insert(output)
        output = d(output)
    }
    
    return result
}

var lastNumbers = Set<Int>.init(1...10000)
var selfNumbers = Array<Int>()
var str = ""

while lastNumbers.count > 0{
    let n = lastNumbers.min()!
    str += "\(n)\n"
    lastNumbers.subtract(makeSeries(of: n))
}

print(str)