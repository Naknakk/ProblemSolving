import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    // 연결된 그룹에서, 비연결 그룹으로 통하는 다리 중에 가장 저렴한 것을 취하면 될 듯?
    
    var edges: [Int: [Int]] = [:]
    var costsForEdge: [Int: [Int]] = [:]
    
    for cost in costs {
        edges[cost[0], default: []].append(cost[1])
        costsForEdge[cost[0], default: []].append(cost[2])
        edges[cost[1], default: []].append(cost[0])
        costsForEdge[cost[1], default: []].append(cost[2])
    }
    
    var connectedNodes: Set<Int> = [0]
    var ans = 0
    
    while connectedNodes.count < n {
        var selectedEdge: [Int] = []
        
        for node in connectedNodes {
            let edge = edges[node]!
            let costForEdge = costsForEdge[node]!
            
            for i in 0..<edge.count {
                let target = edge[i]
                if connectedNodes.contains(target) { continue }
                
                let cost = costForEdge[i]
                if selectedEdge.isEmpty {
                    selectedEdge = [node, target, cost]
                } else if cost < selectedEdge[2] {
                    selectedEdge = [node, target, cost]
                }
            }
        }

        connectedNodes.insert(selectedEdge[1])
        ans += selectedEdge[2]
    }
    
    return ans
}