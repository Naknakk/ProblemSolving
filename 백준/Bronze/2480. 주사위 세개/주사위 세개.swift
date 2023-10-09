var dice = readLine()!.split{$0 == " "}.map{Int(String($0))!}
dice.sort(by: >)

let check = [dice[0] == dice[1], dice[1] == dice[2], dice[2] == dice[0]]



if check[0] && check[1] {
    print("\(10000 + dice[0] * 1000)")
}else if !check[0] && !check[1] {
    print("\(dice[0] * 100)")
}else {
    for i in 0...2 {
        if check[i] {
            print("\(1000 + dice[i] * 100)")
        }
    }
}

