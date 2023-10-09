let startPoint = Character("a").asciiValue!
let endPoint = Character("z").asciiValue!

let s = Array(readLine()!)

for i in startPoint...endPoint {
    var char = Character(UnicodeScalar(i))
    
    if s.contains(char) {
        print("\(s.index(of: char)!)", terminator: " ")
    } else {
        print("-1", terminator: " ")
    }
}

