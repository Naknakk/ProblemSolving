var word = String(readLine()!).uppercased()
var wordArray = Array(word)
var times = wordArray.count

var characterCounter: [Character : Int] = [:]

for i in 0..<times {
    let target = wordArray[i]
    
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
        str = String(key)
        isUnique += 1
    }
}

if isUnique == 1 {
    print(str)    
} else {
    print("?")
}