// N: 지방의 수
// 예산 요청 표현
// M: 총 예산
// 모든 예산 요청의 합이 총 예산 보다 아래인지 먼저 확인하고,
// 불가능 하다면, 특정 정수 값을 찾아서, 이 정수 값보다 위인 예산에 이 상한액을 배정하여 총 예산 안에 처리할 수 있게 한다.
// 가능한 최대의 총 예산을 구해야 하므로, 상한액은 총 예산을 넘지 않게 하는 선에서 최대한 커져야 좋다.
// 상한액에 따라서, 단조적으로 예산 총액을 넘는지-안넘는지가 정해진다.
// 이분탐색 가능. 주어진 상한액에 따라서 예산 총액 넘는지 결정하는 함수도 간단하다.

let N = Int(readLine()!)!
var costs: [Int] = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var totalCost = Int(readLine()!)!

func isAvailable(limit: Int) -> Bool {
    var sum = 0
    for cost in costs {
        sum += cost > limit ? limit : cost
    }
    
    return totalCost >= sum
}

if costs.reduce(0, +) <= totalCost {
    print(costs.max()!)
} else {
    var st = 0
    var en = totalCost
    var mid = (st+en)/2
    var ans = st
    
    while st <= en {
        if isAvailable(limit: mid) {
            ans = mid
            st = mid + 1
        } else {
            en = mid - 1
        }
        mid = (st+en)/2
    }
    
    print(ans)
}