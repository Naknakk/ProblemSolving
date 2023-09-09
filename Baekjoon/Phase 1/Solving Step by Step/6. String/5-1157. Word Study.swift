var word = String(readLine()!).uppercased()
var wordArray = Array(word)

var characterCounter: [Character : Int] = [:]

while !wordArray.isEmpty {
// wordArray.count > 0 은 복잡도가 O(n)임에 주의
    let target = wordArray.removeLast()
    // removeFirst()는 복잡도가 O(n)임에 주의
    
    if characterCounter.keys.contains(target) {
       characterCounter[target]! += 1
    } else {
        characterCounter[target] = 1
    }
}

let max = characterCounter.values.max()!
var str = ""
var isUnique = 0

for (key, value) in characterCounter {
    if value == max {
        str += String(key)
        isUnique += 1
    }
}

if isUnique == 1 {
    print(str)    
} else {
    print("?")
}