func compare(of a: [Int], with b: [Int]) -> Int {
    if a[0] < b[0] && a[1] < b[1] {
        return 1
    }else if a[0] > b[0] && a[1] > b[1]{
        return -1
    }else {
        return 0
    }
}
var N = Int(readLine()!)!
var people: [[Int]] = []
var ranks = Array(repeating: 1, count: N)
while true {
    if let a = readLine() {
        people.append(a.split{$0 == " "}.map{Int(String($0))!})
    }else {
        break
    }
    
}

for i in 0..<N {
    for j in (i+1)..<N {
        let result = compare(of: people[i], with: people[j])
        if result == 1 {
            ranks[i] += 1
        }else if result == -1 {
            ranks[j] += 1
        }
    }
}

for rank in ranks {
    print(rank, terminator: " ")
}