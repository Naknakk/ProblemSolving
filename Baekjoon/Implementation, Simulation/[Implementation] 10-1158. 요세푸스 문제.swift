//
//  main.swift
//  algorithm
//
//  Created by 이윤학 on 2023/09/03.
//

let NK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NK[0], K = NK[1]

var people = Array(repeating: true, count: N)
var result = "<"
var pointer = -1

func addPointer() {
    if pointer == N-1 {
        pointer = 0
    } else {
        pointer += 1
    }
}

for i in 0..<N {
    var count = 0
    
    while count < K {
        addPointer()
        if people[pointer] {
            count += 1
        }
    }
    people[pointer] = false
    
    if i != N-1 {
        result += "\(pointer+1), "
    } else {
        result += "\(pointer+1)>"
    }
}
print(result)
