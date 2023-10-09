let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let cards = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var (N, M) = (input[0], input[1])
var result = 0
var distance = M - result

for i in 0..<N {
    for j in (i+1)..<N {
        for k in (j+1)..<N {
            let sum = cards[i] + cards[j] + cards[k]
            if sum <= M && (M-sum) < distance {
                result = sum
                distance = M - sum
            }
        }
    }
}
print(result)