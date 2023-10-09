let N = Int(readLine()!)!
var cards = Array(repeating: 0, count: N)
var sol = Array(repeating: 0, count: N)

cards[N-1] = N-1
sol[0] = N

var flag = true
var number = N-2
var pointer = 0

for i in 0..<N-1 {
    if i == N-2 {
        cards[pointer] = N
        sol[i+1] = pointer+1
    } else {
        cards[pointer] = number
        sol[i+1] = pointer+1
        
        if flag {
            pointer += number
        } else {
            pointer -= number
        }
        number -= 1
        flag.toggle()
    }
}
print("YES")
var cardsResult = ""
var solResult = ""
if N == 1 {
    cards[0] = 1
}
for i in 0..<N {
    cardsResult += "\(cards[i]) "
    solResult += "\(sol[i]) "
}
print(cardsResult)
print(solResult)
