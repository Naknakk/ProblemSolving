var N = Int(readLine()!)!
var input = Array(1...N)

func takeDivider(input: Int)-> Int{
    if input % 2 != 0 {
        return 2
    } else {
        var divider = 2
        var next = input / 2
        while next % 2 == 0 {
            divider = divider * 2
            next = next / 2

        }
        return divider
    }
    
}

func recursive(input: [Int], flag: Bool) -> ([Int], Bool) {
    let count = input.count
    let isOdd: Bool = (count % 2 != 0)
    var result: [Int] = []
    
    if count == 1 {
        return (input, false)
    }

    if !flag {
        var divider = takeDivider(input: count)
        
        for index in 0..<count where index % divider == divider-1 {
            result.append(input[index])
        }
        return recursive(input: result, flag: isOdd )
    } else {
        for index in 0..<count where index % 2 == 0{
            result.append(input[index])
        }
        return recursive(input: result, flag: !isOdd)
    }
}

print(recursive(input: input, flag: false).0[0])


