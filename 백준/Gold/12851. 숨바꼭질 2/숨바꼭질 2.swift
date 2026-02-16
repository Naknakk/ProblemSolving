let NK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NK[0], K = NK[1]
var dist = Array(repeating: -1, count: 100001)
var ways = Array(repeating: 0, count: 100001)
var queue: [Int] = [N]
dist[N] = 0
ways[N] = 1
var pointer = 0


while pointer < queue.count {
    let cur = queue[pointer]
    
    let nexts = [cur-1, cur+1, cur*2]
    
    for next in nexts {
        if next < 0 || next > 100000 {
            continue
        }
        
        if dist[next] == -1 {
            dist[next] = dist[cur] + 1
            ways[next] += ways[cur]
            queue.append(next)
        } else if dist[next] == dist[cur] + 1 {
            ways[next] += ways[cur]
        }
    
    }
    pointer += 1
}

print(dist[K])
print(ways[K])

