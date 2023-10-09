while true {
    var input = readLine()!
    if input == "." {
        break
    }
    var stack: [Character] = ["."]
    var check = true

    for i in input {
        if i == "(" || i == "[" {
            stack.append(i)
        }    
    
        if i == ")" || i == "]" {
            let isSame1 = (i == ")") && (stack.last == "(")
            let isSame2 = (i == "]") && (stack.last == "[")
        
            if isSame1 || isSame2 {
                stack.removeLast()
            } else {
                check = false
                break
            }
        }
    }
    if stack.count != 1 {
        check = false
    }
    
    print(check ? "yes" : "no")
}
