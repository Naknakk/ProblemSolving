let N = Int(readLine()!)!
let inputs = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var coordinates = Array(repeating:(0, 0), count: N)

for i in 0..<N {
    coordinates[i] = (inputs[i], i)
}
coordinates.sort{$0.0 < $1.0}

func compress(_ coordinates: [(Int, Int)]) -> [Int] {
    var grades = Array(repeating: 0, count: N)
    var grade = 0
    for i in 0..<N{
        if i == 0 {
            grade = 0
        } else if coordinates[i].0 != coordinates[i-1].0 {
            grade += 1
        }
        grades[coordinates[i].1] = grade
    }
    return grades
}
func printResult(_ results: [Int]) {
    var str = ""
    for result in results {
        str += "\(result) "
    }
    print(str)
}

let results = compress(coordinates)
printResult(results)

// 빠른 입출력을 사용하면 456ms, 쓰지 않은 경우 872ms