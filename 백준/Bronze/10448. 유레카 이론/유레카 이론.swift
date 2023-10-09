let T = Int(readLine()!)!

func t(_ n: Int) -> Int {
    return (n*(n+1))/2
}

Outer: for _ in 0..<T {
    let target = Int(readLine()!)!
    
    for i in 1..<45 {
        for j in i..<45 {
            KLoop: for k in j..<45 {
                
                let tsum = [i, j, k].reduce(0, {$0 + t($1)})
                
                if tsum == target {
                    print(1)
                    continue Outer
                } else if tsum > target {
                    break KLoop
                }
                
            }
        }
    }
    print(0)
}