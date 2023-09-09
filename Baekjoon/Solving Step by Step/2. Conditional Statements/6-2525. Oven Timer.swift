let (presentTime, cookingTime) = (readLine()!.split{ $0 == " " }.map{ Int($0)! }, Int(String(readLine()!))!)
let endTime = (presentTime[0] * 60 + presentTime[1] + cookingTime) 

print("\((endTime/60)%24) \(endTime%60)")