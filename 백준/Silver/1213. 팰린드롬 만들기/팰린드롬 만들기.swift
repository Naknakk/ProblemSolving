//
//  main.swift
//  algoritihm
//
//  Created by 이윤학 on 2023/09/03.
//
let inputs = Array(readLine()!).map{String($0)}

var isPossible = true
var middle = ""
var leftSide = ""
var characterCounts: [String: Int] = [:]

for input in inputs {
    characterCounts[input, default: 0] += 1
}

for key in characterCounts.keys.sorted() {
    let count = characterCounts[key]!
    
    if count % 2 == 0 {
        for _ in 0..<count/2 {
            leftSide += key
        }
        
    } else if middle == "" {
        middle = key
        for _ in 0..<count/2 {
            leftSide += key
        }
    } else {
        isPossible = false
        break
    }
}

if isPossible {
    print(leftSide + middle + String(leftSide.reversed()))
} else {
    print("I'm Sorry Hansoo")
}
