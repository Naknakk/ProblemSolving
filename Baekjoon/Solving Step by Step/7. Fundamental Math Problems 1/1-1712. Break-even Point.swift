let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}

if input[2] <= input[1] {
    print("-1")
} else {
    var N = input[0] / (input[2] - input[1]) + 1
    print(N)
}

