var state = true

outer : while state {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    
    inner : if input == [0, 0] {
        break outer
    }
   
    print("\(input[0]+input[1])")
}