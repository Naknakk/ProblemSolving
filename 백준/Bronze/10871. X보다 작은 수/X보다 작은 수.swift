let nx = readLine()!.split{$0 == " "}.map{Int(String($0))!}

let (N, X) = (nx[0], nx[1])

let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var str = ""
for n in input {
    if n < X {
        str += "\(n) "
    }
}
str.removeLast()
print(str)
