let N = Int(readLine()!)!
var restCards: [Int] = []
var cards: [Int] = Array(1...N)
var result: String = ""
var mode = true
while !cards.isEmpty || !restCards.isEmpty {
    if mode {
       result += "\(pop()) "
       mode.toggle()
    } else {
        move()
        mode.toggle()
    }
}
print(result)

func checkEmpty() {
    if restCards.isEmpty {
        restCards = Array(cards.reversed())
        cards = []
    }
}

func pop() -> Int {
    checkEmpty()
    return restCards.removeLast()
}
func move() {
    checkEmpty()
    cards.append(restCards.removeLast())
}