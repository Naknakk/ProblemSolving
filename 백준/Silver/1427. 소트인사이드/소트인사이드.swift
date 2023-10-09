var N = Array(readLine()!).map{Int(String($0))!}
print(N.sorted().reversed().reduce(""){String($0)+String($1)})