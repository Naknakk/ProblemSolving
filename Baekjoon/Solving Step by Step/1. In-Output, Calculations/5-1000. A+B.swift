let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
print(input.reduce(0, {$0 + $1}))