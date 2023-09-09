let T = Int(String(readLine()!))!

for _ in 1...T {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    
    print("\(input[0] + input[1])")
}