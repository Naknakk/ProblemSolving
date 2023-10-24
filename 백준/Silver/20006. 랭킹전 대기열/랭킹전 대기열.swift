let pm = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let p = pm[0], m = pm[1]
typealias Player = [String]


var rooms: [[Player]] = []

for _ in 0..<p {
    let player: Player = readLine()!.split{$0 == " "}.map{String($0)}
    let level = Int(player[0])!
    var availableRoomNumber: Int = -1
    
    Inner: for i in 0..<rooms.count {
        let room = rooms[i]
        let roomLevel = Int(room[0][0])!
        var isFull: Bool = room.count == m
        var isInRange: Bool = level <= roomLevel+10 && level >= roomLevel-10
        
        if !isFull && isInRange {
            availableRoomNumber = i
            break Inner
        }
    }
    
    if availableRoomNumber == -1 {
        rooms.append([player])
    } else {
        rooms[availableRoomNumber].append(player)
    }
}

for room in rooms {
    if room.count == m {
        print("Started!")
    } else {
        print("Waiting!")
    }
    for player in room.sorted(by: {$0[1] < $1[1]}) {
            print("\(player[0]) \(player[1])")
    }
}
