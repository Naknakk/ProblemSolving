import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveryPointer: Int = deliveries.lastIndex(where: {$0 != 0}) ?? -1
    var pickupPointer: Int = pickups.lastIndex(where: {$0 != 0}) ?? -1
    var deliveryList = deliveries
    var pickupList = pickups
    var moveCost: Int = 0

    while deliveryPointer >= 0 || pickupPointer >= 0 {
        var targetIndex = max(deliveryPointer, pickupPointer)
        moveCost += (targetIndex+1)*2
        
        var boxes = cap
        while boxes >= 0 {
            if deliveryPointer < 0 {
                break
            }
            else if deliveryList[deliveryPointer] > 0 {
                if boxes > 0 {
                    deliveryList[deliveryPointer] -= 1
                    boxes -= 1
                } else {
                    break
                }
            }
            else if deliveryPointer >= 0 {
                deliveryPointer -= 1
            }
        }
        
        boxes = cap
        while boxes >= 0 {
            if  pickupPointer < 0 {
                break
            }
            else if pickupList[pickupPointer] > 0 {
                if boxes > 0 {
                    pickupList[pickupPointer] -= 1
                    boxes -= 1
                } else {
                    break
                }
            }
            else if pickupPointer >= 0 {
                pickupPointer -= 1
            }
            
        }
    }
    
    return Int64(moveCost)
}