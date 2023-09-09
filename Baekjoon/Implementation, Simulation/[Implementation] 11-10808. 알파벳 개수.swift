//
//  main.swift
//  algorithm
//
//  Created by 이윤학 on 2023/09/03.
//
let word = readLine()!
var counts = Array(repeating: 0, count: 26)

for char in word {
    let index = Int(char.asciiValue!)-97
    counts[index] += 1
}

for count in counts {
    print(count, terminator: " ")
}
