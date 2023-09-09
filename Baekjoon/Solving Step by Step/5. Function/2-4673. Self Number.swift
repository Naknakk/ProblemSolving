// 5. 함수 2-4673 셀프넘버

// d(n)함수 구현
func d(_ input: Int) -> Int {  
    var n = input
    var result = n
    while n > 0 {
        result += (n % 10)
        
        n /= 10
    }
    return result
}

// Series 생성 함수 구현. 시작 값 n 에 따라 만들어지는 수열을 Set으로 반환
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

// Self Number 감별. 소수 찾기 처럼, 생성자 n에 따라 만들어진 series의 값들을 제외해 나간다.
while lastNumbers.count > 0{
    let n = lastNumbers.min()!
    str += "\(n)\n"
    lastNumbers.subtract(makeSeries(of: n))
}

print(str)