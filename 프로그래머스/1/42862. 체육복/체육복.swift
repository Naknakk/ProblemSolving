import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students: [Int] = Array(repeating: 1, count: n)
    
    for i in lost {
        students[i-1] -= 1
    }
    for i in reserve {
        students[i-1] += 1
    }
    
    for i in 0..<students.count-1 {
        if students[i] + students[i+1] == 2 {
            students[i] = 1
            students[i+1] = 1
        }
    }
    print(students)
    return students.filter{$0 >= 1}.count
}