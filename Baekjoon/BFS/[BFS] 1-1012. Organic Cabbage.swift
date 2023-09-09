let T = Int(readLine()!)!  // testCase의 갯수 입력받기.

let brown = 0   // 배추가 없는 땅
let white = 1   // 배추가 심어진 땅
let green = 2   // 배추가 심어져 있고, 이미 방문한 땅.

// 주변 node 탐색 코드를 편하게 구현하기 위한 배열들.
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<T {  // TestCase 만큼 반복
        
        // 땅의 M: 가로, N: 세로이며, K는 심은 배추의 총 갯수이다.
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let (M, N, K): (Int, Int, Int) = (input[0], input[1], input[2])
        
        // line은 땅의 한 세로줄, map은 이 세로줄을 모아 만든 전체 땅. 아직 배추의 위치를 모르기 때문에 0으로 초기화하였다.
        // map[x][y]를 통해 가로의 좌표 x, 세로의 좌표 y인 땅의 상태를 알 수 있다.
    let line: [Int] = Array(repeating: 0, count: N)
    var map: [[Int]] = Array(repeating: line, count: M)

    var count = 0  // 배추가 인접해 심어져 있는 블록의 갯수를 세기위한 변수.
    
    for _ in 0..<K {  // 배추의 위치를 입력받고, map에 white(1)로 표시해 준다.
        let cabbage = readLine()!.split{$0 == " "}.map{Int(String($0))!}
        map[cabbage[0]][cabbage[1]] = white
    }
      
        // 모든 위치에 BFS를 해봐야 하므로, 가능한 모든 x와 y에 대해 반복문을 돌린다.
    for x in 0..<M {
        for y in 0..<N {
                        // 시작 위치에 배추가 없거나(brown), 이미 방문한 곳이라면(green) BFS를 시작할 필요가 없으므로 넘어간다.
            if map[x][y] != white { continue }
                        
                        // 시작위치에 배추가 있다면, 새로운 배추 블록을 찾은 것이므로 카운터를 하나 올리고,
                        // DFS를 통해 그 배추 블록 전체에 방문 표시를 하여 중복으로 방문하지 않도록 한다.
            count += 1

            var current: [[Int]] = [[x, y]]  // BFS 시작 위치
            var next: [[Int]] = []           // BFS로 탐색할 다음 계층의 노드들이 저장되는 곳.

                        // current는 계속해서 비는 순간 next로 업데이트 되므로, 만약 빈다면 모든 노드의 탐색이 끝난 것이다.
            while !current.isEmpty {
            
                let cur = current.removeLast()  // 이번에 탐색할 노드. removeLast()를 하므로 지그재그로 탐색이 된다.
                
                for i in 0..<4 {  // 인근 노드 탐색 시작
                    let nx = cur[0]+dx[i]
                    let ny = cur[1]+dy[i]
                    
                    if (nx < 0 || nx > M-1 || ny < 0 || ny > N-1) {  // 인덱스 범위 밖인 경우 처리
                        continue
                    }
                    
                    if map[nx][ny] == white {   // 배추가 심어져있고, 아직 방문하지 않은 곳을 발견한다면
                        map[nx][ny] = green     // 방문 표시를 하고,
                        next.append([nx, ny])   // 탐색할 다음 계층의 노드들이 저장되는 next에 추가한다.
                                        
                                                // 여담. next = [[nx, ny]]+next 를 하면.. 지그재그 아니고 일반적인 BFS 탐색하듯이 가능하다. 속도는 어떨지 불확실. // 속도 망함 ㅎㅎㅎ..
                    }
                }
                
                if current.isEmpty {  // current가 완전히 비면, 이번 계층의 탐색이 끝난 것이므로 다음 계층의 탐색을 시작하도록 대입해 준다.
                    current = next  // 노드 탐색이 완료되어 next가 []라면, current는 여전히 비어있게 되므로 BFS가 while문의 종료조건에 의해 끝난다.
                    next = []
                }
            }
        }
    }
    print(count)
}
