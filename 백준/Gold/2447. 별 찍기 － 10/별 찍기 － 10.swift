func stringSum(_ a: [String], _ b: [String], _ c: [String]) -> [String]? {
    let resultCount = a.count
    if resultCount != b.count || resultCount != c.count{
        return nil
    }
    var result = Array(repeating: "", count: resultCount)
    for i in 0..<resultCount {
        result[i] = a[i] + b[i] + c[i]
    }
    return result
}

func makeSpace(N: Int) -> [String] {
    var space = ""
    for _ in 1...N {
        space += " "
    }
    return Array(repeating: space, count: N)
}

func stars(N: Int) -> [String] {
    if N == 3 {
        return ["***", "* *", "***"]
    }else {
        let lasts = stars(N: N/3)
        let spaces = makeSpace(N: N/3)
        var result: [String] = []
        result += stringSum(lasts, lasts, lasts)!
        result += stringSum(lasts, spaces, lasts)!
        result += stringSum(lasts, lasts, lasts)!
        return result
    }
}

for star in stars(N: Int(readLine()!)!) {
    print(star)
}