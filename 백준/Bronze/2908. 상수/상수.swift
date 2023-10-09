let inputs = readLine()!.split(separator: " ")
let A = Int(String(inputs[0].reversed()))!
let B = Int(String(inputs[1].reversed()))!
print(A > B ? A : B)
