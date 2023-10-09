func convert(of input: Character) -> Int {
    switch input {
        case "A"..."C":
            return 3
        case "D"..."F":
            return 4
        case "G"..."I":
            return 5
        case "J"..."L":
            return 6
        case "M"..."O":
            return 7
        case "P"..."S":
            return 8
        case "T"..."V":
            return 9
        case "W"..."Z":
            return 10
        default:
            return 0
    }
}

let inputs = Array(readLine()!)
var result = 0
for input in inputs {
    result += convert(of: input)
}
print(result)