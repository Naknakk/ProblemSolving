struct Heap {
    private var elements: [Int] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func push(_ element: Int) {
        elements.append(element)
        shiftUp()
    }
    
    private func isSorted(_ a: Int, _ b: Int) -> Bool {
        if abs(a) < abs(b) {
            return true
        } else if abs(a) == abs(b) {
            return a <= b
        } else {
            return false
        }
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
    
    mutating func pop() -> Int? {
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


let N = Int(readLine()!)!
var heap = Heap()
var output = ""

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if input == 0 {
        if heap.isEmpty {
            output += "0\n"
        } else {
            let value = heap.pop()!
            output += "\(value)\n"
        }
    } else {
        heap.push(input)
    }
}

print(output)