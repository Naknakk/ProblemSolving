import Foundation

var keyPad: [Int: (Int, Int)] = [
    1: (0, 0), 2: (0, 1), 3: (0, 2),
    4: (1, 0), 5: (1, 1), 6: (1, 2),
    7: (2, 0), 8: (2, 1), 9: (2, 2),
    10: (3, 0), 0: (3, 1), 11: (3, 2)
]

var leftHand = 10
var rightHand = 11


func solution(_ numbers: [Int], _ hand: String) -> String {
    var result = ""
    
    for number in numbers {
        let moveHand = selectHand(to: number, mainHand: hand)
        
        if moveHand == "left" {
            leftHand = number
            result.append("L")
        } else {
            rightHand = number
            result.append("R")
        }
    }
    
    return result
}



func caculateDistance(from hand: Int, to number: Int) -> Int{
    let handPosition = keyPad[hand]!
    let numberPosition = keyPad[number]!
    
    let dr = abs(handPosition.0 - numberPosition.0)
    let dc = abs(handPosition.1 - numberPosition.1)
    
    return dr+dc
}

func selectHandOfMiddleLine(to number: Int, mainHand: String) -> String {
    let leftDistance = caculateDistance(from: leftHand, to: number)
    let rightDistance = caculateDistance(from: rightHand, to: number)
    
    if leftDistance == rightDistance {
        return mainHand
    } else {
        return leftDistance < rightDistance ? "left" : "right"
    }
}

func selectHand(to number: Int, mainHand: String) -> String {
    if [1, 4, 7].contains(number) {
        return "left"
    } else if [3, 6, 9].contains(number) {
        return "right"
    } else {
        return selectHandOfMiddleLine(to: number, mainHand: mainHand)
    }
}



