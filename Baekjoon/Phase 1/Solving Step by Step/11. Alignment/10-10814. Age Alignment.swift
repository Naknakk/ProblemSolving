let N = Int(readLine()!)!
var infos = Array(repeating: (0, ""), count: N)
for i in 0..<N {
    let input = readLine()!.split{$0 == " "}
    infos[i] = (Int(input[0])!, String(input[1]))
}
infos.sort(by: {$0.0 < $1.0})
var str = ""
for info in infos {
    str += "\(info.0) \(info.1)\n"
}
print(str)
// 최고 속도인 152ms에 도달!
// 빠른 입출력을 사용하면 104ms로 1등!