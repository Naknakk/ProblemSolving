let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let treeHeights = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var (lo, hi) = (0, treeHeights.max()!)

while lo + 1 < hi {
    let mid = (lo + hi) / 2
    var sumHeight = 0
    
    for treeHeight in treeHeights {
        let cuttedHeight = treeHeight - mid
        if cuttedHeight < 0 {
            continue
        } else {
            sumHeight += cuttedHeight
        }
    }
    
    if sumHeight < M {
        hi = mid
    } else {
        lo = mid
    }
}

print(lo)