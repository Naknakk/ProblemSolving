// N개의 숫자로 구분된 마을별로 학생이 한 명씩
// N명의 학생이 X번 마을에 모임.
// M개의 단방향 도로, i번째 길 지나는데 T_i 시간
// 각각의 학생은, 본인 마을 -> 파티 장소 X -> 다시 본인 마을 로 돌아와야 한다.
// 최단 시간
// 단방향이기 때문에 오고 가는 길이 다름.
// 마을 N < 1000, 도로 M < 10000
// 10000 log1000 * 1000 == 10^5 * 10^3 = 10^8
// 그래프 뒤집기로 다익스트라 두번..

struct Heap {
    // 마을 번호 / 현재 최단 시간
    private var elements: [(Int, Int)] = []
    
    func isSorted(_ a: (Int, Int), _ b: (Int, Int)) -> Bool {
        return a.1 < b.1
    }
    
    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        shiftUp()
    }
    
    private mutating func shiftUp() {
        var child = elements.count-1
        
        while child > 0 {
            let parent = (child-1)/2
            
            if !isSorted(elements[parent], elements[child]) {
                elements.swapAt(parent, child)
                child = parent
            } else {
                break
            }
        }
    }
    
    mutating func pop() -> (Int, Int)? {
        if elements.isEmpty { return nil }
        if elements.count == 1 { return elements.removeLast() }
        
        let minValue = elements[0]
        elements[0] = elements.removeLast()
        shiftDown()
        
        return minValue
    }
    
    private mutating func shiftDown() {
        var parent = 0
        let limit = elements.count
        
        while true {
            let leftChild = parent*2+1
            let rightChild = parent*2+2
            var target = parent
            
            if leftChild<limit && !isSorted(elements[target], elements[leftChild]) {
                target = leftChild
            }
            
            if rightChild<limit && !isSorted(elements[target], elements[rightChild]) {
                target = rightChild
            }
            
            if parent == target {
                break
            } else {
                elements.swapAt(parent, target)
                parent = target
            }
        }
    }
}

let NMX = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NMX[0], M = NMX[1], X = NMX[2]-1
var edges: [[(Int, Int)]] = Array(repeating: [], count: N)
var reversedEdges: [[(Int, Int)]] = Array(repeating: [], count: N)

for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let st = input[0]-1, en = input[1]-1, time = input[2]
    
    edges[st].append((en, time))
    reversedEdges[en].append((st, time))
}

var distFromX: [Int] = Array(repeating: Int.max, count: N)
var heapFromX = Heap()
distFromX[X] = 0
heapFromX.push((X, 0))

while let cur = heapFromX.pop() {
    let town = cur.0
    let minTime = cur.1
    
    if minTime > distFromX[town] { continue }
    
    for edge in edges[town] {
        let en = edge.0
        let time = edge.1
        
        if distFromX[en] > distFromX[town] + time {
            distFromX[en] = distFromX[town] + time
            heapFromX.push((en, distFromX[en]))
        }
    }
}

var distToX: [Int] = Array(repeating: Int.max, count: N)
var heapToX = Heap()
distToX[X] = 0
heapToX.push((X, 0))

while let cur = heapToX.pop() {
    let town = cur.0
    let minTime = cur.1
    
    if minTime > distToX[town] { continue }
    
    for edge in reversedEdges[town] {
        let en = edge.0
        let time = edge.1
        
        if distToX[en] > distToX[town] + time {
            distToX[en] = distToX[town] + time
            heapToX.push((en, distToX[en]))
        }
    }
}

var ans = 0
for i in 0..<N {
    ans = max(distToX[i] + distFromX[i], ans)
}

print(ans)


