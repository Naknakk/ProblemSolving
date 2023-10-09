let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var start = input[0]
var result = "mixed"

if start == 1 {
    result = "ascending"
    start += 1
    for i in 1..<8 {
       if start == input[i] {
           start += 1
       } else {
           result = "mixed"
           break
       }
    }
    
} else if start == 8 {
    result = "descending"
    start -= 1
    for i in 1..<8 {
       if start == input[i] {
           start -= 1
       } else {
           result = "mixed"
           break
       }
    }
}
print(result)