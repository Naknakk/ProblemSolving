import Foundation

func solution(_ name:String) -> Int {
    // 각 칸에 도착시 무조건 글자를 완성한다. -> 위 아래 결정 필요
    // 칸 이동 방향은 한 쪽 방향이면 된다. -> 첫번째 위치에서.. 처음으로 어느 쪽으로 갈지만 정하면 된다. -> 바로 붙어있는 0이 적은 쪽으로 이동하면 됨.
    // 걍 양쪽 이동 해보고 min 쳐도 될 듯.

    let arr: [Int] = name.map{$0.asciiValue!}.map { value in
        let up = value - 65
        let down = 91 - value
        return Int(min(up, down))
    }

    var move = arr.count-1
    var i = 0
    while i < arr.count {
        var next = i+1
        while next < arr.count {
            if arr[next] == 0 {
                next += 1
            } else {
                break
            }
        }
        
        let option1 = i + (arr.count-next) * 2
        let option2 = i * 2 + (arr.count-next)
        
        move = min(move, option1, option2)
        i = next
    }
    
    
    return arr.reduce(0, +) + move
}