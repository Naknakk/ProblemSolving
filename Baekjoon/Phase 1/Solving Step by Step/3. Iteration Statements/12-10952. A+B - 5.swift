// 방법 1

var state = true

outer : while state {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    
    inner : if input == [0, 0] {
        break outer
    }
   
    print("\(input[0]+input[1])")
}

// 방법 2

var state = true

while state {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    
     if input == [0, 0] {
        state = false
    } else {
           print("\(input[0]+input[1])")   
     }
}