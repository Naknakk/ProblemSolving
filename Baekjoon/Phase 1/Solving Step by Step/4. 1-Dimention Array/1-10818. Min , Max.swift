let N = readLine()!
let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}

print("\(input.min()!) \(input.max()!)")