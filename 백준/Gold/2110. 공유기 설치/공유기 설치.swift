let NC = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NC[0], C = NC[1]

var houses: [Int] = []
for _ in 0..<N {
    houses.append(Int(readLine()!)!)
}
houses.sort(by: {$0 < $1})

func check(limit: Int) -> Bool {
    var current = houses[0]
    var count = 1
    
    for house in houses {
        let diff = house - current
        if diff >= limit {
            current = house
            count += 1
        }
    }
    
    return count >= C
}

var st = 1000000000
for i in 0..<houses.count-1 {
    st = min(houses[i+1]-houses[i], st)
}
var en = 1000000000
var mid = (st+en)/2
var ans = st

while st <= en {
    if check(limit: mid) {
        ans = mid
        st = mid + 1
    } else {
        en = mid - 1
    }
    
    mid = (en+st)/2
}

print(ans)

// 인접한 두 공유기 사이의 최대 거리 구하기
// 최소 거리 ~~~ 1,000,000,000 가 범위.
// 여기서.. 최소거리 ~ 특정 값 까지는 이 거리가 인접한 두 공유기의 최대거리가 되는게 가능,
// 그 이후로는 계속 불가능.
// 이분탐색.
// 그럼 가능 불가능 여부 판단 방법? 
// greedy 하게,, 어떤 값인 경우, 그 값 이상으로 계속 집을 선택해나가야함
// 그랬을 때 공유기 개수가 남거나, 끝에 도달해서 선택할 수 없거나.. 하면 끝임.