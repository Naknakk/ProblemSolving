import Foundation

func solution(_ new_id:String) -> String {
    
    return ID(id: new_id).checkId()
}

class ID {
    private var id: String
    let badCharacters = "~!@#$%^&*()=+[{]}:?,<>/"
    
    init(id: String) {
        self.id = id
    }
    
    func checkId() -> String {
        makeLowercase()
        return getId()
    }
    
    func makeLowercase() {
        id = id.lowercased()
        
        removeBadCharacters()
    }
    
    func removeBadCharacters() {
        id.removeAll{badCharacters.contains($0)}
        
        replaceDots()
    }
    
    func replaceDots() {
        id = id.split{$0 == "."}.map{String($0)}.reduce("", {$0+"."+$1})
        
        if !id.isEmpty {
            id.removeFirst()
        }
        
        handleEmptyId()
    }
    
    func handleEmptyId() {
        if id.isEmpty {
            id = "a"
        }
        
        handleOverRange()
    }
    
    func handleOverRange() {
        id = String(id.prefix(15))
        if id.last == "." {
            self.replaceDots()
        }
        
        handleUnderRange()
    }
    
    func handleUnderRange() {
        if id.count == 1 {
            id = id+id+id
        } else if id.count == 2 {
            id = id+String(id.last!)
        }
    }
    
    func getId() -> String {
        return id
    }
}
