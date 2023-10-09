let inputNumber = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (A, B) = (inputNumber[0], inputNumber[1])
let setAElement = readLine()!.split{$0 == " "}.map{String($0)}
let setBElement = readLine()!.split{$0 == " "}.map{String($0)}

var (setA, setB) = (Set(setAElement), Set(setBElement))

var setIntersection = setA.intersection(setB)

print((A + B) - setIntersection.count*2)