import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var data = Data(N: N, stages: stages)
    
    var failRates = data.caculateFailRate()
    
    failRates.sort(by: {
        if $0.1 > $1.1 {
            return true
        } else if $0.1 < $1.1 {
            return false
        } else if $0.0 < $1.0 {
            return true
        } else {
            return false
        }
    })
    print(failRates)
    
    var failRatesOnlyStageNumber: [Int] = Array(repeating: 0, count: N)
    for i in 0..<N {
        failRatesOnlyStageNumber[i] = failRates[i].0
    }
    
    return failRatesOnlyStageNumber
}

class Data {
    init(N: Int, stages: [Int]) {
        self.N = N
        self.stages = stages
    }
    
    let N: Int
    let stages: [Int]
    
    func caculateFailRate() -> [(Int, Double)] {
        var failCounts: [Double] = Array(repeating: 0, count: N+1)
    
        for stage in stages {
        failCounts[stage-1] += 1
        }
    
        var arrivedCounts: [Double] = Array(repeating: Double(stages.count), count: N)
    
        for i in 0..<N-1 {
            arrivedCounts[i+1] = arrivedCounts[i] - failCounts[i]
        }
    
        var failRates: [(Int, Double)] = []
    
        for i in 0..<N {
            failRates.append((i+1, failCounts[i] / arrivedCounts[i]))
        }
    
        return failRates
    }

}


