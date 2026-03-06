let N = Int(readLine()!)!

class MinHeap {
    var elements: [Int] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    private func leftChild(of parent: Int) -> Int {
        return parent*2+1
    }
    
    private func rightChild(of parent: Int) -> Int {
        return parent*2+2
    }
    
    private func parent(of child: Int) -> Int {
        return (child-1)/2
    }
    
    func push(_ element: Int) {
        elements.append(element)
        shiftUp()
    }
    
    private func shiftUp() {
        var child = elements.count-1
        
        while child > 0 {
            let parent = parent(of: child)
            
            if elements[parent] > elements[child] {
                elements.swapAt(child, parent)
                child = parent
            } else {
                break
            }
        }
    }
    
    func pop() -> Int? {
        if isEmpty { return nil }
        if elements.count == 1 { return elements.removeLast() }
        
        let minValue = elements[0]
        elements[0] = elements.removeLast()
        shiftDown()
        
        return minValue
    }
    
    private func shiftDown() {
        var parent = 0
        let limit = elements.count
        
        while true {
            let leftChild = leftChild(of: parent)
            let rightChild = rightChild(of: parent)
            var target = parent
            
            if leftChild < limit && elements[target] > elements[leftChild] {
                target = leftChild
            } 
            if rightChild < limit && elements[target] > elements[rightChild] {
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

var heap = MinHeap()
for _ in 0..<N {
    heap.push(Int(readLine()!)!)
}


var sum = 0
    
while heap.count > 1 {
    let cur = heap.pop()! + heap.pop()!
    sum += cur
    heap.push(cur)
}
    
print(sum)

