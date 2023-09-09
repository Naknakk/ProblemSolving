var N = Int(readLine()!)!
var results: [Int] = []
var number = 2
    
while N > 1 {
    if number*number > N {
        print(N)
        break
    }
    
    while N%number == 0 {         
        N /= number    
        print(number)
    }
    number += 1    
}

// 아래와 같이 제곱근 규칙을 쓰지 않은 경우 시간이 292ms. 위 코드는 8ms
var N = Int(readLine()!)!
var results: [Int] = []
var number = 2
    
while N > 1 {     
    while N%number == 0 {         
        N /= number    
        results.append(number)
    }
    number += 1    
}

if !results.isEmpty {
    for result in results {
        print(result)
    }
}