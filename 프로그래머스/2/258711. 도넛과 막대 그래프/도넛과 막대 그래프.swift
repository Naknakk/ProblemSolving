import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var inputs: [Int: [Int]] = [:]
    var outputs: [Int: [Int]] = [:]
    
    for edge in edges {
        outputs[edge[0], default: []].append(edge[1])
        inputs[edge[1], default: []].append(edge[0])
    }
    
    let nodeMaxNumber = max(outputs.keys.max()!, inputs.keys.max()!)
    var addedNodeNumber: Int = 0
    for i in 1...nodeMaxNumber {
        if inputs[i] == nil && (outputs[i]?.count ?? 0) >= 2 {
            addedNodeNumber = i
            break
        }
    }
    
    enum GraphType: Int {
        case donut = 1
        case stick = 2
        case eight = 3
    }
    
    func findType(startNode: Int) -> GraphType {
        var currentNode: Int = startNode

        while true {
            let outputEdges = outputs[currentNode] ?? []
            let inputEdges = inputs[currentNode] ?? []

            // 막대
            if outputEdges.isEmpty {
                return .stick
            }

            // 8자
            if inputEdges.count >= 2 && outputEdges.count == 2 {
                return .eight
            }

            // 도넛을 찾기 위한 순환 확인
            currentNode = outputEdges.first!

            if currentNode == startNode {
                return .donut
            }
        }
    }

    
    var answer = [addedNodeNumber, 0, 0, 0]
    
    let graphNodes = outputs[addedNodeNumber] ?? []
    for graphNode in graphNodes {
        let type = findType(startNode: graphNode)
        answer[type.rawValue] += 1
    }

    
    return answer
}