let NM = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let N = NM[0], M = NM[1]
var map: [[Int]] = []
for _ in 0..<N {
    map.append(Array(readLine()!).map{Int(String($0))!})
}
var que: [(Int, Int)] = [(0, 0)]
var broken: [Bool] = [false]
let dr = [-1, 1, 0, 0], dc = [0, 0, -1, 1]
let notVisited = 0, wall = 1, brokenWall = 2, visitAfterBroken = 3, visitWithoutBroken = 4
var count = 1
var exit = (N==1 && M==1)
var result = exit ? 1 : -1
map[0][0] = visitWithoutBroken

func bfs() {
    var nextQue: [(Int, Int)] = []
    var nextBroken: [Bool] = []
    
    bfs: for i in 0..<que.count {
        let cur = que[i]
        
        for j in 0..<4 {
            let nr = cur.0+dr[j]
            let nc = cur.1+dc[j]
            
            if nr<0 || nr>N-1 || nc<0 || nc>M-1 {
                continue
            }
            
                        // case 1. 아직까지 벽을 안 부순 루트가 갈 수 있는 길 중 첫번째: 벽을 부수지 않고 이동하는 것.
                        // 이때, 벽을 부순 루트가 방문 표시를 해둔 곳도 갈 수 있도록 해야하기 때문에,
                        // 방문하지 않은 곳인지 혹은 벽을 부순 루트가 방문한 곳인지 둘 다 체크하도록 했다.
            if (map[nr][nc] == notVisited || map[nr][nc] == visitAfterBroken) && !broken[i] {
                map[nr][nc] = visitWithoutBroken
                nextQue.append((nr, nc))
                nextBroken.append(broken[i])
                        
                        // case 2. 아직까지 벽을 안 부순 루트가 갈 수 있는 길 중 두번째: 벽을 부수고 가기!
                        // 벽을 부술 수 있는 능력을 아직 갖고 있으므로, 벽을 만나더라도 부수고 가면 된다.
                        // 이때 부숴버린 벽은 별도의 방문 표시를 해두어 다른 루트가 다시 방문하지 못하도록 했다.
                        // 그냥 벽을 부숴버린 루트의 방문 표시를 한다면, 벽을 부수지 않은 루트가 어 벽이 없네? 하고 지나갈 수 있기 때문.
            } else if map[nr][nc] == wall && !broken[i] {
                map[nr][nc] = brokenWall
                nextQue.append((nr, nc))
                nextBroken.append(true)

                        // case 3. 벽을 한번 부순 루트가 갈 수 있는 길. 그냥 길 따라 가는 수 밖에 없다.
                        // 이때, 벽을 한번 부순 루트는 벽을 부수지 않은 루트보다 우선순위가 낮기 때문에 추가적으로 방문할 수 있는 곳이 없다.
                        // 방문하려는 곳이 벽을 부수지 않은 루트가 지난 곳이라면,
                        // 벽을 부수지 않아도 더 빨리 도착할 수 있는 곳이기 때문에 갈 필요가 없다.
            } else if map[nr][nc] == notVisited && broken[i] {
                map[nr][nc] = visitAfterBroken
                nextQue.append((nr, nc))
                nextBroken.append(broken[i])
            }
        }
    }
    que = nextQue
    broken = nextBroken
}

// map 에 거리 표시를 직접 하지 않기 때문에, 이처럼 거리가 같은 점을 모두 탐색하고 다음 거리로 나아갈 때 count를 더해주어 거리를 알 수 있게 하였다.
while !exit {
    count += 1
    bfs()
    if map[N-1][M-1] != 0 {
        result = count
        exit = true
    } else if que.isEmpty {
        exit = true
    }
}
print(result)
