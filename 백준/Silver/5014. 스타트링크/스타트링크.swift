let values = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
let max = values[0]
let start = values[1]
let target = values[2]
let dx = [values[3], (0-values[4])]

var map = Array(repeating: -1, count: max+1)
map[0] = 0
map[start] = 0

var queue = [start]
var pointer = 0
var result = "use the stairs"

while pointer < queue.count {
    let now = queue[pointer]
    if now == target {
        result = "\(map[now])"
        break
    }
    
    for i in 0..<dx.count {
        let next = now+dx[i]
        
        if next > max || next < 1 {
            continue
        }
        if map[next] != -1 {
            continue
        }
        
        
        map[next] = map[now] + 1
        queue.append(next)
    }
    pointer += 1
}

print(result)
