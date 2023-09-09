let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (a, b) = (input[0], input[1])

print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%b)