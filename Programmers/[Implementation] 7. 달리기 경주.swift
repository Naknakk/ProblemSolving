import Foundation

var minKeyCount: [Character: Int] = [:]

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    for keyInfo in keymap {
        let keyInfoArray: [Character] = Array(keyInfo)
        
        for pushCount in 1...keyInfoArray.count {
            let alphabet = keyInfoArray[pushCount-1]
            let nowCount = minKeyCount[alphabet, default: pushCount]
            
            if nowCount >= pushCount {
                minKeyCount[alphabet] = pushCount
            }
        }
    }
    var result: [Int] = []
    
    for target in targets {
        var count = 0
        
        let targetArray: [Character] = Array(target)
        
        Inner: for alphabet in targetArray {
            if let pushCount = minKeyCount[alphabet] {
                count += pushCount
            } else {
                count = -1
                break Inner
            }
        }
        
        result.append(count)
    }
    
    return result
}
