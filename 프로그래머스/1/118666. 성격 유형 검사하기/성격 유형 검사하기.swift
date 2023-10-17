import Foundation

// 0: +R-T, 1: +C-F, 2: +J-M, 3: +A-N
// 0 이상이면 앞의 성격유형.

var mbtiScores: [[Character] : Int] = [
    ["R", "T"]: 0,
    ["C", "F"]: 0,
    ["J", "M"]: 0,
    ["A", "N"]: 0
]

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let n = survey.count
    
    for i in 0..<n {
        let targetSurvey = survey[i]
        let choice = choices[i]
        let score = transformChoiceToScore(survey: targetSurvey, choice: choice)

        
        Inner: for (mbtiType, value) in mbtiScores {
            if mbtiType.contains(targetSurvey.first!) {
                mbtiScores[mbtiType]! += score
                break Inner
            }
        }
    }
    
    var results = ""
    
    results += mbtiScores[["R", "T"]]! >= 0 ? "R" : "T"
    results += mbtiScores[["C", "F"]]! >= 0 ? "C" : "F"
    results += mbtiScores[["J", "M"]]! >= 0 ? "J" : "M"
    results += mbtiScores[["A", "N"]]! >= 0 ? "A" : "N"
    
    return results
}


func isInvert(_ survey: String) -> Bool {
    let sortedSurvey = String(survey.sorted(by: <))
    return sortedSurvey != survey
}

func transformChoiceToScore(survey: String, choice: Int) -> Int {
    let score = isInvert(survey) ? (choice-4) : -(choice-4)
    return score
}
