var result = Set<Int>()
for _ in 1...10 {
    result.insert(Int(String(readLine()!))!%42)
}
print(result.count)