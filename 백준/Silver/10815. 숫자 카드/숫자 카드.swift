var N = Int(readLine()!)!
var handCardSet = Set(readLine()!.split{$0 == " "}.map{Int(String($0))!})
var M = Int(readLine()!)!
var targetCards = readLine()!.split{$0 == " "}.map{Int(String($0))!}

func check(_ n: Int) -> String {
    if handCardSet.contains(n) {
        return "1"
    } else {
        return "0"
    }
}

var output = ""

for targetCard in targetCards{
    output += "\(check(targetCard)) "
}
output.removeLast()

print(output)