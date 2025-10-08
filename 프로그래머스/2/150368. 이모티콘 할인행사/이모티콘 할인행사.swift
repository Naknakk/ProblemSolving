import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var rates: [Int] = Array(repeating: 0, count: emoticons.count)
    var maxAssignCount: Int = 0
    var maxIncomeTotal: Int = 0
    var assignCount: Int = 0
    var incomeTotal: Int = 0
    
    func rateCheckAndUpdate() {
        assignCount = 0
        incomeTotal = 0
        
        for user in users {
            let limitRate = user[0]
            let limitSpend = user[1]
            var currentSpend: Int = 0
            
            for i in 0..<emoticons.count {
                let rate = rates[i]
                if rate >= limitRate {
                    currentSpend += emoticons[i]*(100-rate)/100
                }
            }
            
            if currentSpend >= limitSpend {
                assignCount += 1
            }
            else {
                incomeTotal += currentSpend
            }
        }
        
        if assignCount > maxAssignCount {
            maxAssignCount = assignCount
            maxIncomeTotal = incomeTotal
        }
        else if assignCount == maxAssignCount && incomeTotal > maxIncomeTotal {
            maxIncomeTotal = incomeTotal
        }
    }
    
    func dfs(level: Int) {
        if level == emoticons.count {
            rateCheckAndUpdate()
            return
        }
    
        for rate in [10, 20, 30, 40] {
            rates[level] = rate
            dfs(level: level+1)
        }
    }
    
    dfs(level: 0)
    
    return [maxAssignCount, maxIncomeTotal]
}