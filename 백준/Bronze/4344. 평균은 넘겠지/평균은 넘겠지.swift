let C = Int(String(readLine()!))!

func average(scores: [Double], number: Double) -> Double {
    var result: Double = 0.0
    for score in scores {
        result += score / number
    }
    
    return result
}

func percentage(average: Double, scores: [Double], number: Double) -> [Int] {
    var count = 0
    
    for score in scores {
        if score > average {
            count += 1
        }
    }

    var result = count * 100 * 10000 / Int(number)
    
    if (result % 10) < 5 {
        result /= 10
    } else {
        result = result / 10 + 1
    }
    var outputs: [Int] = [0, 0, 0, 0, 0]
    for i in 1...5 {
        outputs[5-i] = result%10
        result /= 10
    }
 
    return outputs
}


for _ in 1...C {
    var input = readLine()!.split{$0 == " "}.map{Double(String($0))!}    
    let N = input.removeFirst()
    let average = average(scores: input, number: N)
    let results = percentage(average: average, scores: input, number: N)
    
    var str = ""
    
    for i in 0...4 {
        if i == 2 {
            str += "."
        }
        
        str += "\(results[i])"
    }
    
    print(str+"%")
}