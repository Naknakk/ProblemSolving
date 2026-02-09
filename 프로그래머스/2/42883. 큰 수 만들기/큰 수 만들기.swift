import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numbers = Array(number).map{Int(String($0))!}
    var stack: [Int] = [numbers[0]]
    var canRemove = k
    
    for i in 1..<numbers.count {
        while canRemove > 0 && !stack.isEmpty {
            if stack.last! < numbers[i] {
                stack.removeLast()
                canRemove -= 1
            } else {
                break
            }
        }
        stack.append(numbers[i])
    }
    
    while canRemove > 0 {
        stack.removeLast()
        canRemove -= 1
    }
    
    return stack.map{String($0)}.joined()
}