var input: [Int] = []
for _ in 1...9 {
    input.append(Int(String(readLine()!))!)
}
let max = input.max()!
let maxIndex = input.firstIndex(of: max)! + 1

print(max)
print(maxIndex)