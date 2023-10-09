var input = readLine()!.split{$0 == " "}.map{Int(String($0))!}

let goalHeight = input[2] - input[0]
let dailyMoving = input[0] - input[1]
var goalDate = 1
if goalHeight % dailyMoving == 0 {
    goalDate += (goalHeight / dailyMoving)
} else {
    goalDate += (goalHeight / dailyMoving + 1)
}

print(goalDate)