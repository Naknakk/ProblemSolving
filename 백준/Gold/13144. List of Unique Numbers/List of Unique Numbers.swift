// 그냥 완전 탐색하는 경우는 n(n+1)/2 .. 초과할 가능성 크다.
// 정렬이니뭐니 그런 수열 변형은 불가능하구 탐색하면서.. 불가능한 경우에 빠르게 넘어가는 방법은?
// st가 고정된 채 en을 늘려갈 때, 중복이 한 번이라도 생기면 더이상 해당 st를 포함하는 수열에서는
// 중복이 없는 수열이 불가능함. (기존 수열에서 더 추가되는 형태기 때문에)
// en을 늘려가며 

let N = Int(readLine()!)!
let array = readLine()!.split{$0 == " "}.map{Int(String($0))!}

var count = 0
var st = 0
var en = 1
var numbers: Set<Int> = [array[0]]

while st < N {
    if en == N {
        count += numbers.count
        numbers.remove(array[st])
        st += 1
    } else if numbers.contains(array[en]) {
        count += numbers.count
        numbers.remove(array[st])
        st += 1
    } else {
        numbers.insert(array[en])
        en += 1
    }   
}

print(count)