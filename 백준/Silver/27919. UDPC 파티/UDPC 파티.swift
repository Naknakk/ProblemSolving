let input = Array(readLine()!)
var count = ["U": 0, "D": 0, "P": 0, "C": 0]

for i in input {
    count[String(i)]! += 1
}

func otherMax(_ others: [String]) -> Int {
    var sum = 0
    for i in others {
        sum += count[i]!
    }
    if sum%2 != 0 {
        return sum / 2 + 1
    } else {
        return sum / 2
    }
}

let UCheck = (count["U"]! + count["C"]!)
> otherMax(["D", "P"])

let DnPCheck = (count["D"]! + count["P"]!) != 0

if UCheck && DnPCheck {
    print("UDP")
} else if UCheck && !DnPCheck {
    print("U")
} else if !UCheck && DnPCheck {
    print("DP")
}
