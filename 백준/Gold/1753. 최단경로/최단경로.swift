struct Heap {
    // 정점 , 거리
    private var elements: [(Int, Int)] = []
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    func isSorted(_ a: Int, _ b: Int) -> Bool {
        let aValue = elements[a]
        let bValue = elements[b]
        
        return aValue.1 < bValue.1
    }
    
    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        shiftUp()
    }
    
    private mutating func shiftUp() {
        var child = elements.count - 1
        
        while child > 0 {
            let parent = (child-1)/2
            
            if !isSorted(parent, child) {
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
            
            if leftChild < limit && !isSorted(target, leftChild) {
                target = leftChild
            }
            
            if rightChild < limit && !isSorted(target, rightChild) {
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

let VE = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (V, E) = (VE[0], VE[1])
let K = Int(readLine()!)! - 1
var edges: [Int: [(Int, Int)]] = [:]

for _ in 0..<E {
    let UVW = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let u = UVW[0]-1, v = UVW[1]-1, w = UVW[2]
    edges[u, default: []].append((v, w))
}

var heap = Heap()
var dist: [Int] = Array(repeating: Int.max, count: V)
dist[K] = 0
heap.push((K, 0))

while let cur = heap.pop() {
    if dist[cur.0] != cur.1 { continue }
    
    guard let edgeSet = edges[cur.0] else { continue }
    
    for edge in edgeSet {
        if dist[edge.0] > dist[cur.0] + edge.1 {
            dist[edge.0] = dist[cur.0] + edge.1
            heap.push((edge.0, dist[edge.0]))
        }
    }
}

var output = ""
for i in 0..<V {
    if dist[i] == Int.max {
        output += "INF\n"
    } else {
        output += "\(dist[i])\n"
    }
}
print(output)
