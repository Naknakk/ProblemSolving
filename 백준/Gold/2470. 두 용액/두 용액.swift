// 사실상 두 수를 더해서, 0에 가장 가까운 값을 만들기임.
// 모든 조합 계산..-> 10^10 불가. O(N^2)
// 이분탐색..? 용액 특성 값에 abs를 취하면, 해당 값보다 작은 특성의 용액을 만들 수 있냐.. - 로 단조적으로 가능하긴 할 듯.
// 근데 결정 문제가 해당 값보다 작은 특성의 용액을 만들 수 있냐..이걸 어떻게 N만에 처리하느냐 정도가 문제일 듯..
// 주어진 용액 특성값을 정렬을 해볼까?

// -10 -2 -1 4 25
// 양쪽에서 포인터가 가운데로 모아지는거지. 
// 값이 음수고 0에서 멀어지면, 왼쪽게 안으로, 값이 양수고 0에서 멀어지면, 오른쪽게 안으로.
// 엥 이러면 근데 한 번 스캔하면 바로 min을 얻을 수 있을 듯.
// 현재 min값과 비교해서, 새로운 min 값을 갱신하면 포인터 위치와 값 모두 저장.

let N = Int(readLine()!)!

let values = readLine()!.split{$0 == " "}.map{Int(String($0))!}.sorted(by: <)

var st = 0, en = N-1
var ans: (Int, Int) = (st, en)
var currentMin = Int.max

while st < en {
    let sum = values[st] + values[en]
    
    if abs(sum) < currentMin {
        ans = (st, en)
        currentMin = abs(sum)
    } 
    
    if sum > 0 {
        en -= 1
    } else if sum < 0 {
        st += 1
    } else if sum == 0 {
        break
    }
}

print("\(values[ans.0]) \(values[ans.1])")
