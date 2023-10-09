import Foundation

private var size = 0
private var paper: [[Int]] = []
var counts = [0, 0, 0]

let fileIO = FileIO()

let numOfLine = fileIO.readInt()

size = numOfLine

for _ in 0 ..< numOfLine {

    var buf: [Int] = []
    
    for _ in 0 ..< numOfLine {
        buf.append(fileIO.readInt())
    }
    paper.append(buf)

}

func solution(x: Int, y: Int, size: Int) {
    
    if isPossibleCutOut(x: x, y: y, size: size) {
        return
    }
    
    let newSize = size / 3
    
    for i in 0..<3 {
        for j in 0..<3 {
            solution(x: x + (newSize*i), y: y + (newSize*j), size: newSize)
        }
    }
    
}

private func isPossibleCutOut(x: Int, y: Int, size: Int) -> Bool {
    
    let value = paper[x][y]
    
    for i in x ..< x+size {
        for j in y ..< y+size {
            if paper[i][j] != value { return false }
        }
    }
    
    counts[value+1] += 1
    
    return true
}

solution(x: 0, y: 0, size: size)

for i in counts {
    print(i)
}

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }   
}