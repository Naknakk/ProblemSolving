let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (x, y, w, h) = (input[0], input[1], input[2], input[3])
func findShort(_ now: Int, _ side: Int) -> Int {
    let distance = side - now
    return distance < now ? distance : now
}
let xShort = findShort(x, w)
let yShort = findShort(y, h)
print(xShort < yShort ? xShort : yShort)