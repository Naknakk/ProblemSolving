import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    var giftRecords: [String: [String: Int]] = [:]
    
    for friend in friends {
        giftRecords[friend] = [:]
        for target in friends {
            giftRecords[friend]![target] = 0
        }
    }
    
    for gift in gifts {
        let people = gift.split{$0 == " "}.map{String($0)}
        giftRecords[people[0]]![people[1]]! += 1
        giftRecords[people[1]]![people[0]]! -= 1
    }
    
    var giftPoints: [String: Int] = [:]
    
    for friend in friends {
        let giftPoint = giftRecords[friend]!.values.reduce(0, { $0 + $1 })
        giftPoints[friend] = giftPoint
    }
    
    var giftPredictions: [String: Int] = [:]
    
    for me in friends {
        giftPredictions[me] = 0
        let giftRecord = giftRecords[me]!
        
        for (friend, value) in giftRecord {
            if value > 0 {
                giftPredictions[me]! += 1
            } else if value == 0 {
                let isBetterGiver = giftPoints[me]! > giftPoints[friend]!
                if isBetterGiver {
                    giftPredictions[me]! += 1
                }
            }
        }
    }
    
    let maxGiftPrediction = giftPredictions.values.max()!
    
    return maxGiftPrediction
}