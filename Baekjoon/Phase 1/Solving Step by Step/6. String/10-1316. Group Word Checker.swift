var N = Int(String(readLine()!))!

func checker(_ word: [Character]) -> Bool {
    var elements: [Character] = []
    for character in word {
        if elements.contains(character) {
            if character != elements.last {
                return false
            } 
        } else {
            elements.append(character)
        }
    }
    
    return true
}

var counter = 0

while N > 0 {
    if checker(Array(readLine()!)) {
        counter += 1
    }
    N -= 1
}
print(counter)