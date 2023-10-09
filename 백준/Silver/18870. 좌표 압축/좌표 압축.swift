import Foundation
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fIO = FileIO()

let N = fIO.readInt()
var coordinates = Array(repeating:(0, 0), count: N)
for i in 0..<N {
    coordinates[i] = (fIO.readInt(), i)
}
coordinates.sort{$0.0 < $1.0}

func compress(_ coordinates: [(Int, Int)]) -> [Int] {
    var grades = Array(repeating: 0, count: N)
    var grade = 0
    for i in 0..<N{
        if i == 0 {
            grade = 0
        } else if coordinates[i].0 != coordinates[i-1].0 {
            grade += 1
        }
        grades[coordinates[i].1] = grade
    }
    return grades
}
func printResult(_ results: [Int]) {
    var str = ""
    for result in results {
        str += "\(result) "
    }
    print(str)
}

let results = compress(coordinates)
printResult(results)