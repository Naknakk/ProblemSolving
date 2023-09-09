import Foundation

var C = Int(String(readLine()!))!

func average(scores: [Double], number: Double) -> Double {
    var result: Double = 0.0
    for score in scores {
        result += score
    }
    
    result = result / number
    
    return result
}

func percentage(average: Double, scores: [Double], number: Double) -> String {
    var count: Double = 0.0
    
    for score in scores {
        if score > average {
            count += 1.0
        }
    }
    
    var percentage = count / number * 100.0
    
    let digit: Double = pow(10 ,3)
    
    percentage = round(percentage * digit) / digit
    
    return String(format: "%.3f", percentage)
}

while C > 0 {
    var input = readLine()!.split{$0 == " "}.map{Double(String($0))!}    
    let N = input.removeFirst()
    let average = average(scores: input, number: N)
    let percentage = percentage(average: average, scores: input, number: N)
    
    print("\(percentage)%")
        
    C -= 1
}