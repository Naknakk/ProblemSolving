import Foundation

func solution(_ record:[String]) -> [String] {
    var logs: [(String, Action)] = []
    var names: [String: String] = [:]
    
    for current in record {
        let values = current.split{$0 == " "}.map{String($0)}
        let action = Action(rawValue: values[0])!
        let id = values[1]
        
        if action != .change {
            logs.append((id, action))
        }
        
        if action != .leave {
            names[id] = values[2]
        }
    }
    
    var result: [String] = []
    
    for log in logs {
        let name = names[log.0]!
        result.append(name+"님이 "+log.1.message )
    }
    
    
    return result
}

enum Action: String {
    case enter = "Enter"
    case leave = "Leave"
    case change = "Change"
    
    var message: String {
        switch self {
            case .enter: return "들어왔습니다."
            case .leave: return "나갔습니다."
            default: return ""
        }
    }
}