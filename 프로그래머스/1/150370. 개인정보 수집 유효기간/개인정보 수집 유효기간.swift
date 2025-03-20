import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    DateForm.today = stringToDateForm(today)
    
    var termInfo: [String: Int] = [:]
    for term in terms {
        let data = term.split{ $0 == " " }.map{ String($0) }
        termInfo[data[0]] = Int(data[1])!
    }
    
    var result: [Int] = []
    
    for i in 0..<privacies.count {
        let privacy = privacies[i]
        let data = privacy.split{ $0 == " " }.map{ String($0) }
        let date = stringToDateForm(data[0])
        let dateDiff = DateForm.dateDiffFromToday(date)
        let dateDiffMonth = dateDiff.year * 12 + dateDiff.month
        
        let termMonth = termInfo[data[1]]!
        
        if dateDiffMonth >= termMonth {
            result.append(i+1)
        }
    }
    
    return result
}

struct DateForm {
    var year: Int
    var month: Int
    var day: Int
    
    init(dateParts: [Int]) {
        year = dateParts[0]
        month = dateParts[1]
        day = dateParts[2]
    }
    
    static var today: DateForm = DateForm(dateParts: [0, 0, 0])
    
    static func dateDiffFromToday(_ target: DateForm) -> DateForm {
        var yearDiff = today.year - target.year
        var monthDiff = today.month - target.month
        var dayDiff = today.day - target.day
        
        if dayDiff < 0 {
            monthDiff -= 1
            dayDiff += 28
        }
        
        if monthDiff < 0 {
            yearDiff -= 1
            monthDiff += 12
        }
        
        return DateForm(dateParts: [yearDiff, monthDiff, dayDiff])
    }
}

func stringToDateForm(_ target: String) -> DateForm {
    let dateParts = target.split{$0 == "."}.map{Int(String($0))!}
    
    return DateForm(dateParts: dateParts)
}
