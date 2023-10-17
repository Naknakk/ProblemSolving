import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    typealias userInfo = (reportedCount: Int, reportID: [String], isStopped: Bool, resultMail: Int)
    
    var userBasicInfo: userInfo = (0, [], false, 0)
    
    var userInfos: [String: userInfo] = [:]
    
    for id in id_list {
        userInfos[id] = userBasicInfo
    }
    
    var reports = Set(report.map { rep in
            rep.split{ $0 == " " }.map{ String($0) }
        })
    
    for report in reports {
        userInfos[report[0]]!.reportID.append(report[1])
        userInfos[report[1]]!.reportedCount += 1
        
        if userInfos[report[1]]!.reportedCount >= k {
            userInfos[report[1]]!.isStopped = true
        } 
    }
    
    var results: [Int] = []
    
    for user in id_list {
        var reportIDs = userInfos[user]!.reportID
        
        for reportID in reportIDs {
            if userInfos[reportID]!.isStopped {
                userInfos[user]!.resultMail += 1
            }
        }
        
        results.append(userInfos[user]!.resultMail)
    }
    
    return results
}

