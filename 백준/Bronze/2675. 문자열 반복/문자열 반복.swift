var T = Int(String(readLine()!))!

while T > 0 {
    var input = readLine()!.split{$0 == " "}.map{String($0)}
    
    let R = Int(input.removeFirst())!
    let S = Array(input[0])
    
    for character in S {
        for _ in 1...R {
            print(character, terminator: "")
        }
    }
    print("")
    T -= 1
}