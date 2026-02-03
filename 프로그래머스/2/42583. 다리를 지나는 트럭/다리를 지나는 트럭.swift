import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var time = 0
    var bridge = Array(repeating: 0, count: bridge_length)
    var endTruckCount = 0
    var remainTrucks = truck_weights
    var bridgeWeight = 0
    
    while endTruckCount < truck_weights.count {
        time += 1
        
        let out = bridge.removeFirst()
        bridgeWeight -= out
        if out != 0 {
            endTruckCount += 1
        }
        
        if !remainTrucks.isEmpty {
            let next = remainTrucks.first!
            if next + bridgeWeight <= weight {
                bridge.append(next)
                remainTrucks.removeFirst()
                bridgeWeight += next
            } else {
                bridge.append(0)
            }
        } else {
            bridge.append(0)
        }
    }
    
    return time
}