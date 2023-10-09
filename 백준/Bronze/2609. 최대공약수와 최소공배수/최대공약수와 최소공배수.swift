var inputs = readLine()!.split{$0 == " "}.map{Int(String($0))!}

func euclidean(a: Int, b: Int) -> Int {
    var r = a % b
    if r == 0 {
        return b
    } else {
        return euclidean(a: b, b: r)
    }
}

let gcd = euclidean(a: inputs[0], b: inputs[1])
let lcm = (inputs[0] * inputs[1]) / gcd
print(gcd)
print(lcm)