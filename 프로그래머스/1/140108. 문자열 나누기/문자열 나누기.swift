import Foundation

func solution(_ s: String) -> Int {
    
    let arrayS = Array(s)
    
    var target: Character = " "
    var counter = [0, 0]
    var result = 0
    
    for char in arrayS {
        // start
        if target == " " {
            target = char
            counter[0] += 1
            continue
        }
        
        // count
        if target == char {
            counter[0] += 1
        } else {
            counter[1] += 1
        }
        
        // checkNsplit
        if counter[0] == counter[1] {
            result += 1
            target = " "
            counter = [0, 0]
        }
    }

    if counter[0] != counter[1] {
        result += 1
    }
    
    return result
}