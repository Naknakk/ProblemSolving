// 중간값 이하   - 중간값 초과
// 1  /   5   -> 1
// 1-2     /   5   -> 2
// 1-2     /   5-10  -> 2
// -99-1-2    /   5-10 -> 2
// -99-1-2    /   5-7-10   -> 2
// -99-1-2-3  /    5-7-10   -> 3
// -99-1-2-2 / 3-5-7-10

// 최대 힙 <-> 최소 힙    최대 힙의 루트가 언제나 중간값이 되도록
// 최소 힙의 루트이하인 경우 -> 최대 힙에 넣기
// 넣은 뒤, 최대 힙과 최소 힙의 개수가 같거나, 최소힙이 하나 더 많거나 하도록 유지시키기.



struct Heap {
    private var elements: [Int] = []
    private let priority: (Int, Int) -> Bool
    
    init(priority: @escaping (Int, Int) -> Bool) {
        self.priority = priority
    }
    
    var count: Int {
        elements.count
    }
    
    var topElement: Int? {
        return elements.first
    }
    
    
    mutating func push(_ element: Int) {
        elements.append(element)
        shiftUp()
    }
    
    private mutating func shiftUp() {
        var child = elements.count-1
        
        while child > 0 {
            let parent = (child-1)/2
            if priority(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
            } else {
                break
            }
        }
    }
    
    mutating func pop() -> Int? {
        if elements.isEmpty { return nil }
        if elements.count == 1 { return elements.removeLast() }
        
        let top = elements[0]
        elements[0] = elements.removeLast()
        shiftDown()
        
        return top
    }
    
    private mutating func shiftDown() {
        var parent = 0
        let limit = elements.count
        
        while true {
            var target = parent
            let leftChild = parent*2+1
            let rightChild = parent*2+2
            
            if leftChild < limit && priority(elements[leftChild], elements[target]) {
                target = leftChild
            }
            if rightChild < limit && priority(elements[rightChild], elements[target]) {
                target = rightChild
            }
            
            if target == parent { 
                break 
            } else {
                elements.swapAt(target, parent)
                parent = target
            }
        }
    }
}

var minHeap = Heap(priority: <)
var maxHeap = Heap(priority: >)

let N = Int(readLine()!)!
var output = ""

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if maxHeap.topElement == nil || input <= maxHeap.topElement! {
        maxHeap.push(input)
    } else {
        minHeap.push(input)
    }
    
    if maxHeap.count > minHeap.count+1 {
        let value = maxHeap.pop()!
        minHeap.push(value)
    } else if minHeap.count > maxHeap.count  {
         let value = minHeap.pop()!
        maxHeap.push(value)
    }
    
    output += "\(maxHeap.topElement!)\n"
}
print(output)
