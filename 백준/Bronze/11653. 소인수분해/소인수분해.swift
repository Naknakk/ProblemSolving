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