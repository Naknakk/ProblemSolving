var X = Int(String(readLine()!))!
var address = 1
var numberSum = 2

while address < X {
    address = address + numberSum
    numberSum += 1
}

let distance = address - X
var denominator = 0


if numberSum % 2 == 0 {
    denominator = numberSum - 1 - distance
} else {
    denominator = 1 + distance
}


print("\(numberSum - denominator)/\(denominator)")