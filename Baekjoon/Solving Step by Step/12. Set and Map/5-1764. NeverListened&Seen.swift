let inputNumber = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (N, M) = (inputNumber[0], inputNumber[1])

var (neverListened, neverSeen) = (Set<String>(), Set<String>())
for _ in 0..<N {
    neverListened.insert(readLine()!)
}
for _ in 0..<M {
    neverSeen.insert(readLine()!)
}
var neverListenedSeen = neverListened.intersection(neverSeen).sorted(by: <)

print(neverListenedSeen.count)
for name in neverListenedSeen {
    print(name)
}