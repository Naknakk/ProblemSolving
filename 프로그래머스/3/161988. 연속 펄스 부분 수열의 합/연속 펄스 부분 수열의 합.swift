import Foundation

// 펄스 수열: 1 or -1로 시작, 1과 -1이 번갈아 나오는 수열
// 연속 부분 수열: 제시된 수열의 연속된 부분
// 연속 펄스 부분 수열: 연속 부분 수열에 동일한 길이의 펄스 수열을 곱한 것.
// 구할 것 -> 연속 펄스 부분 수열의 합 중 가장 큰 것

// DP문제임이 분명하다 . .!
// 그냥 하는 경우, 부분 수열 개수 -> 500000+499999+ ... + 1 -> (n+1)n/2 -> n^2
// 펄스 수열 경우의 수 2 -> 2n^2...500,000*500,000*2 = 500,000,000,000 = 5 * 10^12 불가
// -> 무조건 DP로 가야함.
// 합의 최대. . 100,000*500,000 = 50,000,000,000. . . 수가 굉장히 크다. Int64로 가져가야함.

// dp[w]의 정의는?

// 2, 3, -6 까지 있다고 하면..
// 2, 3, -6
// 2 -3 +6 = 5 or -2 + 3 -6 = -5.
// 어라, 한 펄스 수열 버전에 -를 곱한거랑 같네.
// 2, 3, -6, 1, 3, -1, 2, 4
// 2, -3, -6, -1
// -2, 3, 6, 1
// 0 1 2 3 4 5 6
// 2 3 

// w가 마지막인 연속 부분 수열의 합의 최대
// 펄스 방식을 하나로 통일해 ? 아니,
// 1로 시작하는 펄스와, -1로 시작하는 펄스를 곱한 수열에서 각각 max를 구해서
// 둘 중에 큰 값을 반환. -> 이러면 모든 펄스의 경우를 확인한게 됨.
// 어떤 구간을 잘라봐도 그에 대한 모든 펄스 곱한 경우가 나오기 때문.



func solution(_ sequence:[Int]) -> Int64 {
    var plusSequence: [Int] = sequence
    var minusSequence: [Int] = sequence
    
    for i in 0..<sequence.count {
        if i%2 == 0 {
            plusSequence[i] = sequence[i]
            minusSequence[i] = sequence[i]*(-1)
        } else {
            plusSequence[i] = sequence[i]*(-1)
            minusSequence[i] = sequence[i]
        }
    }
    
    var plusDP: [Int64] = plusSequence.map{Int64($0)}
    var minusDP: [Int64] = minusSequence.map{Int64($0)}
    
    for i in 1..<sequence.count {
        plusDP[i] = max(plusDP[i-1] + plusDP[i], plusDP[i])
        minusDP[i] = max(minusDP[i-1] + minusDP[i], minusDP[i])
    }
    
    var ans: Int64 = max(plusDP.max()!, minusDP.max()!)
    
    return ans
}