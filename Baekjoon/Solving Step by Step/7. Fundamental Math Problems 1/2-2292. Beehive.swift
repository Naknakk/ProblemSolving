let N = Int(readLine()!)!
var address = 1
var level = 1

// 점화식을 이용해 계산.
while address < N {
    address = address + level*6
    level += 1
}

print(level)