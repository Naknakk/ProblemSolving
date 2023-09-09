while let input = readLine() {
    if input == "0" {
        break
    }
    let test = Array(input)
    let count = test.count
    let reverse = Array(String(input.reversed()))
    var flag = true
    
    for index in 0..<count {
        if test[index] != reverse[index] {
            flag = false
            break
        }
    }
    print(flag ? "yes" : "no")
}
