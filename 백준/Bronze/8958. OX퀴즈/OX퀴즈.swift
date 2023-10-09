let N = Int(String(readLine()!))!


func printScore(results: [Character]) {
    var scoreSum = 0
    var weight = 0
    
    for result in results {
        if result == "O" {
            scoreSum += (1 + weight)
            weight += 1
        } else {
            weight = 0
        }
    }
    
    print(scoreSum)
}

for _ in 1...N {
    let results = Array(readLine()!)
    printScore(results: results)
}