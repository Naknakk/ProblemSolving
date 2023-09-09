func underBar(_ level: Int) -> String {
    var str = ""
    if level != 0 {
        for _ in 1...(level*4) {
        str += "_"
        }
    }
    return str
}
func startCheck(_ level: Int) -> String {
    var str = ""
    if level == 0 {
        str += "어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다." + "\n"
    }
    return str
}

func recursion (N: Int, level: Int) -> String {
    var str = ""
    str += startCheck(level)
    if N == 0 {
        str += underBar(level) + #""재귀함수가 뭔가요?""# + "\n"
        str += underBar(level) + #""재귀함수는 자기 자신을 호출하는 함수라네""# + "\n"
        for i in 0...level {
            str += underBar(level-i) + "라고 답변하였지." + "\n"
        }
         return str
    } else {
        str += underBar(level) + #""재귀함수가 뭔가요?""# + "\n"
        str += underBar(level) + #""잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."# + "\n"
        str += underBar(level) + #"마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."# + "\n"
        str += underBar(level) + #"그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.""# + "\n"
        return str + recursion(N: N-1, level: level+1)
    }
}
print(recursion(N: Int(readLine()!)!, level: 0))