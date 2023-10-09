let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let squares = input.map{($0*$0)%10}
print(squares.reduce(0, {($0+$1)%10}))