let NS = readLine()!.split{ $0 == " "}.map{Int(String($0))!}
let N = NS[0]
let S = NS[1]
var arr = readLine()!.split {$0 == " "}.map{Int(String($0))!}

var st = 0
var en = 0
var ans = N+1
var sum = arr[0]

while true {
     if sum < S {
         en += 1
         if en == N { break }
         sum += arr[en]
     } else {
         let length = en - st + 1
         if length < ans { ans = length }
         sum -= arr[st]
         st += 1
     }
}

print(ans == N+1 ? 0 : ans)