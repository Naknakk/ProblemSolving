let T = Int(String(readLine()!))!

for i in 1...T {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    print("Case #\(i): \(input[0]) + \(input[1]) = \(input[0] + input[1])")
}