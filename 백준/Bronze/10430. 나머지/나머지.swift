let input = readLine()!.split(separator: " ").map{Int(String($0))!}

let (a, b, c) = (input[0], input[1], input[2])

print((a+b)%c)
print(((a%c)+(b%c))%c)
print((a*b)%c)
print(((a%c)*(b%c))%c)