// N개의 도시
// 도시에서 도시로 이동하는 M개의 버스
// 목표: A 도시에서 B도시로 가는 버스 비용 최소화
// -> A B는 마지막 입력으로 주어진다 !!! , 도착점을 갈 수 있는 경우만 주어짐
// 버스 정보 형식: 출발 도시 - 도착 도시 - 비용. 비용은 0 이상.

// -> 비용이 음수가 아니고, 비용 최소화 문제, 하나의 출발점이면 다익스트라.
// 주의!! 도시 번호에 -1 해줘야함

struct Heap {
    // 도시 번호 / 현재 최소 비용
    private var elements: [(Int, Int)] = []
    
    func isSorted(_ a: (Int, Int), _ b: (Int, Int)) -> Bool {
        return a.1 < b.1
    }
    
    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        shiftUp()
    }
    
    private mutating func shiftUp() {
        var child = elements.count - 1
        
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
            
            if target == parent {
                break
            } else {
                elements.swapAt(parent, target)
                parent = target
            }
        }
    }
}

var heap = Heap()

let N = Int(readLine()!)!, M = Int(readLine()!)!
var edges: [[(Int, Int)]] = Array(repeating: [], count: N)

for _ in 0..<M {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let st = input[0]-1, en = input[1]-1, cost = input[2]
    edges[st].append((en, cost))
}

let AB = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let A = AB[0]-1, B = AB[1]-1

var dist: [Int] = Array(repeating: Int.max, count: N)
dist[A] = 0
heap.push((A, 0))

while let cur = heap.pop() {
    let city = cur.0
    let minCost = cur.1
    
    if minCost > dist[city] { continue }
    
    for edge in edges[city] {
        let en = edge.0
        let cost = edge.1
        
        if dist[en] > dist[city] + cost {
            dist[en] = dist[city] + cost
            heap.push((en, dist[en]))
        }
    }
}

print(dist[B])