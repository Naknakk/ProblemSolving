var T = Int(String(readLine()!))!
while T > 0 {
    var input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    var floor = 0
    var number = 0
    
    if input[2] % input[0] == 0 {
        floor = input[0]
        number = input[2] / input[0]
    } else {
        floor = input[2] % input[0]
        number = input[2] / input[0] + 1
    }
    
    if number < 10 {
        print("\(floor)0\(number)")
    } else {
        print("\(floor)\(number)")
    }
    T -= 1
}