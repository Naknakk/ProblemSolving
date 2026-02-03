import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    var nodes = rocks.sorted{ $0 < $1} + [distance]
    
    var min = 1
    var max = distance
    var mid = (min+max)/2
    var result = min
    
    while min <= max {
        if solve(n, nodes: nodes, limit: mid) {
            result = mid
            min = mid+1
        } else {
            max = mid-1
        }
        mid = (min+max)/2
    }
    
    return result
}


// 돌 빼기 전 현재 상태에서의 최솟값 -> min
// 최댓값 -> distance
// 이 사이에서는 단조적으로 결정됨. 최소 -> 최대로 갈 때 어떤 값부터는 계속 불가능해짐.
// 이걸 어떻게 평가할까..
// 최솟값의 최대값.. 예를 들어서 5를 주어줬다면, 모든 간격이 5보다 반드시 같거나 커야 한다.
// 순서대로 간격을 측정하고,, 만약 5보다 작은 간격이 있으면 다음 돌을 제거하는 형태? -> 최소 간격을 맞추기 위해서 부숴야 하는 돌의 최솟값을 구할 수 있고.,
// 이 부숴야 하는 돌의 최솟값이 n이하면 해당 최솟값의 최댓값이 가능하다는 말임.
// 모르겠으니 일단 해보자.. 근데 한쪽 끝은 고정되어 있으니까 되는게 맞을 듯?

func solve( _ n: Int, nodes: [Int], limit: Int) -> Bool {
    var prev = 0
    var count = 0
    
    for node in nodes {
        if node - prev < limit {
            count += 1
        } else {
            prev = node
        }
    }
    
    return count <= n
}

