let N = Int(readLine()!)!
var words: [[String]] = []
for _ in 0..<N {
    words.append(Array(readLine()!).map{String($0)})
}

var main: [Int] = change(of: words[0])
var target: [Int] = []
var count = 0

for i in 1..<N {
    target = change(of: words[i])
    if isOK() {
        count += 1
    }
}

print(count)


func isOK() -> Bool {
    var count = 0
    var diff: [Int] = []
    
    for i in 0..<26 {
        if main[i] != target[i] {
            count += 1
            diff.append(main[i]-target[i])
        }
    }
    
    var result = false
    let case1 = count == 0
    let case2 = (count == 1) && (abs(diff[0]) == 1)
    let case3 = (count == 2) && (abs(diff[0]) == 1) && (abs(diff[1]) == 1) && (diff[0]+diff[1] == 0)
    
    if case1 || case2 || case3 {
        result = true
    }
    
    return result
}


func change(of word: [String]) -> [Int] {
    var wordArray = Array(repeating: 0, count: 26)
    
    for character in word {
        let index = Int(UnicodeScalar(character)!.value) - 65
        
        wordArray[index] += 1
    }
    return wordArray
}
