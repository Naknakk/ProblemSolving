var inputNumbers = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (inputNumbers[0], inputNumbers[1])
var array: [String] = Array(repeating: "", count: N)
var dictionary: [String: Int] = [:]

for index in 0..<N {
    var input = readLine()!
    array[index] = input
    dictionary[input] = index+1
}



var str = ""

for _ in 0..<M {
    var input = readLine()!
    
    if let number = Int(input) {
        str += "\(array[number-1])\n"
    } else {
        str += "\(dictionary[input]!)\n"
    }
}
print(str)