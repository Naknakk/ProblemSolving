let n = Int(readLine()!)!

var map: [[Int]] = []
for _ in 0..<n {
    map.append( readLine()!.split{$0 == " "}.map{ Int(String($0))! } )
}
var result = 0

func sum() {
    for r in 0..<n {
        var line = Array(repeating: 0, count: n)
        var index = 0
        
        var last = 0
        
        for c in 0..<n {
            if map[r][c] != 0 {
            
                if map[r][c] == last {
                    line[index] = last*2   
                    last = 0
                    index += 1
                } else {
                    
                    if last != 0 {
                        line[index] = last
                        index += 1
                        last = map[r][c]
                    } else {
                        last = map[r][c]
                    }
                    
                }

            }
        }
        
        if last != 0 {
            line[index] = last
        }
        
        map[r] = line
    }
    
}

func rotate() {
    var rotateMap = map
    
    for r in 0..<n {
        for c in 0..<n {
            rotateMap[r][c] = map[n-1-c][r]
        }
    }
    
    map = rotateMap
}


func findMax() -> Int {
    var maximum = 0
    
    for r in 0..<n {
        let lineMax = map[r].max()!
        maximum = max(maximum, lineMax)
    }
    
    return maximum
}

for _ in 0..<4 {
    let lastMap1 = map
    sum()

    for _ in 0..<4 {
        let lastMap2 = map
        sum()
        
        for _ in 0..<4 {
            let lastMap3 = map
            sum()
            
            for _ in 0..<4 {
                let lastMap4 = map
                sum()
                
                for _ in 0..<4 {
                    let lastMap5 = map
                    sum()
                    
                    result = max(result, findMax())
                    
                    map = lastMap5
                    rotate()
                }
                map = lastMap4
                rotate()
            }
            map = lastMap3 
            rotate()
        }
        map = lastMap2   
        rotate()
    }
    map = lastMap1   
    rotate()
}

print(result)