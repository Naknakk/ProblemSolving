var state = true

while state {
    if let input = readLine() {
        let n = input.split{$0 == " "}.map{Int(String($0))!}
        print("\(n[0]+n[1])")
    } else {
         state = false  
    }
}