let basicData = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M, B) = (basicData[0], basicData[1], basicData[2])
var landData: [Int: Int] = [:]
for _ in 0..<N {
    let line = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    for i in line {
        landData[i, default: 0] += 1
    }
}
let minHeight = landData.keys.min()!
let maxHeight = landData.keys.max()!
var result: (Int, Int) = (0, 0)
var height = maxHeight

while height >= minHeight {
    var neededBlock = 0
    var addedBlock = 0
    for i in landData {
        if i.key >= height {
            addedBlock += (i.key - height)*i.value
        } else {
            neededBlock += (height - i.key)*i.value
        }
    }
    
    if neededBlock <= (addedBlock + B) {
        let time = neededBlock + addedBlock*2
        if result == (0, 0) || result.0 > time {
            result = (time, height)
        }
    }
    
    height -= 1
}

print("\(result.0) \(result.1)")