// R: 배열에 있는 수의 순서 뒤집기
// D: 배열의 첫 번째 수를 버리기, 비어있을 때 사용하면 에러.
// 함수는 조합해서 한 번에 사용 가능. 
// - RDD: 뒤집기, 첫 수 버리기, 첫 수 버리기
// 배열 초기값과 수행할 함수 -> 최종 결과 배열로 출력, 에러 발생 시 error

let T = Int(readLine()!)!

for _ in 0..<T {
    let sequence: [String] = Array(readLine()!).map{String($0)}
    let N = Int(readLine()!)!
    let array: [String] = readLine()!.split{$0 == "," || $0 == "[" || $0 == "]"}
                            .map{String($0)}
    
    var left = 0
    var right = N-1
    var reversed = false
    var isError = false
    
    Inner: for op in sequence {
        if op == "R" {
            reversed.toggle()
        } else if op == "D" {
            if left > right {
                isError = true
                break Inner
            } else {
                if reversed {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
    }
    
    if isError {
        print("error")
    } else {
        var result: [String] = []
        
        if left > right {
            result = []
        } else if reversed {
            for i in stride(from: right, through: left, by: -1) {
                result.append(array[i])
            }
        } else {
            for i in left...right {
                result.append(array[i])
            }
        }
        let output = "[\(result.joined(separator: ","))]"
        print(output)
        
    }
    
}