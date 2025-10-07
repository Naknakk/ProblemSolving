import Foundation

func solution(_ k: Int, _ num: [Int], _ links: [[Int]]) -> Int {
    var left = num.max()!
    var right = num.reduce(0, {$0 + $1})
    var limit = (left+right)/2
    var cut: Int = 0
    var answer = limit
    
    func dfs(_ node: Int) -> Int {
        if node == -1 {
            return 0
        }

        let children = links[node]
        let leftSum = dfs(children[0])
        let rightSum = dfs(children[1])
        
        if leftSum + rightSum + num[node] <= limit {
            return leftSum + rightSum + num[node]
        } 
        else if num[node] + min(leftSum, rightSum) <= limit {
            cut += 1
            return num[node] + min(leftSum, rightSum)
        } 
        else {
            cut += 2
            return num[node]
        }
    }

    func findTopNode(_ links: [[Int]]) -> Int {
        var nodes: [Bool] = Array(repeating: true, count: links.count)

        for link in links {
            for child in link {
                if child == -1 { continue }
                nodes[child] = false
            }
        }

        for i in 0..<nodes.count {
            if nodes[i] { return i }
        }

        return 0
    }
    
    let topNode = findTopNode(links)
    
    while left <= right {
        limit = (left+right)/2
        cut = 0
        dfs(topNode)
        
        if cut <= k-1 {
            answer = limit
            right = limit-1
        } else {
            left = limit+1
        }
    }
    
    return answer
}

