import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var playerAndRanks: [String : Int] = [:]
    var rankNumber = 0
    
    for player in players {
        playerAndRanks[player] = rankNumber
        rankNumber += 1
    }
    
    var resultPlayers = players
    
    for winnerName in callings {
        let winnerRank = playerAndRanks[winnerName]!
        let loserName = resultPlayers[winnerRank-1]
        
        resultPlayers.swapAt(winnerRank, winnerRank-1)
        
        playerAndRanks[winnerName] = winnerRank - 1
        playerAndRanks[loserName] = winnerRank
        
    }
    
    return resultPlayers
}
