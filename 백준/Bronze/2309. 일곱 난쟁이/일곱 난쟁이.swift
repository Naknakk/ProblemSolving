var heights = Array(repeating: 0, count: 9)
for i in 0..<9 {
    heights[i] = Int(readLine()!)!
}
heights.sort{$0 < $1}

let allSum = heights.reduce(0, +)
var canUse = Array(repeating: true, count: 9)

Outer: for i in 0..<8 {
    for j in i+1..<9 {
        let sum = allSum - (heights[i] + heights[j])
        if sum == 100 {
            canUse[i] = false
            canUse[j] = false
            break Outer
        }
    }
}

for i in 0..<9 {
    if canUse[i] {
        print(heights[i])
    }
}