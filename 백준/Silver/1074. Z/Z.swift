let Nrc = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, r, c) = (Nrc[0], Nrc[1], Nrc[2])
let rc: [Int] = [r, c]

func z(N: Int, cor: [Int]) -> Int {
    if N == 1 {
        let map = [[0, 1], [2, 3]]
        return map[cor[0]][cor[1]]
    }
    var lastLen = 1
    for _ in 0..<N-1 {
        lastLen *= 2
    }
    
    var lastCor = cor
    var addRate = 0
    for i in 0..<2 {
       if cor[i] >= lastLen {
           lastCor[i] = cor[i] - lastLen
           if i == 0 {
               addRate += 2
           } else {
               addRate += 1
           }
        }
    }
    return z(N: N-1, cor: lastCor) + (lastLen*lastLen)*addRate
}
print(z(N: N, cor: rc))