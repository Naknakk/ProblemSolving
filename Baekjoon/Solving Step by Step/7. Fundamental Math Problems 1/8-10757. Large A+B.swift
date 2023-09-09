var input = readLine()!.split{$0 == " "}.map{Array(String($0))}
let A = input[0]
let B = input[1]
var Acount = A.count
var Bcount = B.count
var result: [Int] = []
var last = 0
var sum = 0

if Acount == Bcount {
    while Bcount > 0 {
        sum = Int(String(A[Acount-1]))!+Int(String(B[Bcount-1]))! + last
        if sum < 10 {
            result.append(sum)
            last = 0
        } else {
            result.append(sum%10)
            last = sum/10
        }
        Bcount -= 1
        Acount -= 1
    }
    if last != 0 {
        result.append(last)
    }
    
} else if Acount > Bcount {
    while Bcount > 0 {
        sum = Int(String(A[Acount-1]))!+Int(String(B[Bcount-1]))! + last
        if sum < 10 {
            result.append(sum)
            last = 0
        } else {
            result.append(sum%10)
            last = sum/10
        }
        Bcount -= 1
        Acount -= 1
    }
    while Acount > 0 {
        sum = Int(String(A[Acount-1]))! + last
        if sum < 10 {
            result.append(sum)
            last = 0
        } else {
            result.append(sum%10)
            last = sum/10
        }
        Acount -= 1
    }
    if last != 0 {
        result.append(last)
    }
} else {
    while Acount > 0 {
        sum = Int(String(A[Acount-1]))!+Int(String(B[Bcount-1]))! + last
        if sum < 10 {
            result.append(sum)
            last = 0
        } else {
            result.append(sum%10)
            last = sum/10
        }
        Bcount -= 1
        Acount -= 1
    }
    while Bcount > 0 {
        sum = Int(String(B[Bcount-1]))! + last
        if sum < 10 {
            result.append(sum)
            last = 0
        } else {
            result.append(sum%10)
            last = sum/10
        }
        Bcount -= 1
    }
    if last != 0 {
        result.append(last)
    }
}
for number in result.reversed() {
    print(number, terminator: "")
}