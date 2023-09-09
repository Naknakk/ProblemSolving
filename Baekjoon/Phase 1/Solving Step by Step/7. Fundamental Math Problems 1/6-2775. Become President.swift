func howMany(k: Int, n: Int) -> Int { 
    if k == 0 && n > 0{
        return n
    } else if n == 1 {
        return 1
    } else {
        return howMany(k: k-1, n: n) + howMany(k: k, n: n-1)
    }
}

var T = Int(String(readLine()!))!

while T > 0 {
    let (k, n) = (Int(String(readLine()!))!, Int(String(readLine()!))!)
    print(howMany(k: k, n: n))
    
    T -= 1
}