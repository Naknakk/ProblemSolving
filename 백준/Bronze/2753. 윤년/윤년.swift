let year = Int(readLine()!)!

if year % 4 == 0 {
    if year % 100 != 0 || year % 400 == 0 {
        print("1")
    } else{
        print("0")
    }
}else {
    print("0")
}