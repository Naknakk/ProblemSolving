let (x, y) = (Int(readLine()!)!, Int(readLine()!)!)

switch (x, y) {
    case (1...1000, 1...1000):
        print(1)
    case (-1000..<0, 1...1000):
        print(2)
    case (-1000..<0, -1000..<0):
        print(3)
    case (1...1000, -1000..<0):
        print(4)
    default:
        print("error")
}