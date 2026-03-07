// 목표 1 -> v1 or v2 -> v2 or v1 -> N 으로 최단거리
// N: 정점 개수, E: 간선 개수 
// v1, v2 : 반드시 지나야 하는 추가 간선. 서로 다름.


// 다익스트라
// 시작점이 1, v1, v2 이 세가지를 해야 하나 ..?
// 구해야 하는 것. 1->v1 / 1->v2 / v1->v2 / v1->N / v2->v1/ v2->N
// 1 -> v1 -> v2 -> N or 1 -> v2 -> v1 -> N
// 다익스트라를 한 뒤, 위 두 경로 중 어느 값이 최단경로인지 결정해서 출력하면 될 듯.


// 주의!
// 정점 번호에는 -1 해줘야 함 !!
// 길은 양방향이므로, 엣지 추가시 주의 !!
// 도착 못하는 경우도 있음 -> -1 출력

struct Heap {
    // 간선 번호 / 현재 최단 거리 
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


func dijkstra(start: Int, edges: [[(Int, Int)]]) -> [Int] {
    var dist: [Int] = Array(repeating: Int.max, count: edges.count)
    var heap = Heap()
    dist[start] = 0
    heap.push((start, 0))
    
    while let cur = heap.pop() {
        let st = cur.0
        let minCost = cur.1
        if minCost > dist[st] { continue }
        
        for edge in edges[st] {
            let en = edge.0
            let cost = edge.1
            
            if dist[en] > dist[st] + cost {
                dist[en] = dist[st] + cost
                heap.push((en, dist[en]))
            }
        }
    }
    
    return dist
}


let NE = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NE[0], E = NE[1]
var edges: [[(Int, Int)]] = Array(repeating: [], count: N)
for _ in 0..<E {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let a = input[0]-1, b = input[1]-1, dist = input[2]
    edges[a].append((b, dist))
    edges[b].append((a, dist))
}
let V1V2 = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let V1 = V1V2[0]-1, V2 = V1V2[1]-1

var distFrom0 = dijkstra(start: 0, edges: edges)
var distFromV1 = dijkstra(start: V1, edges: edges)
var distFromV2 = dijkstra(start: V2, edges: edges)

let dist0V1 = distFrom0[V1]
let dist0V2 = distFrom0[V2]
let distV1V2 = distFromV1[V2]
let distV1N = distFromV1[N-1]
let distV2V1 = distFromV2[V1]
let distV2N = distFromV2[N-1]

var ans = Int.max

if dist0V1 != Int.max && distV1V2 != Int.max && distV2N != Int.max {
    ans = min(dist0V1 + distV1V2 + distV2N, ans)
}

if dist0V2 != Int.max && distV2V1 != Int.max && distV1N != Int.max {
    ans = min(dist0V2 + distV2V1 + distV1N, ans)
}
print(ans == Int.max ? -1 : ans)