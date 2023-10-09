var kg = Int(String(readLine()!))!
var count5kg = 0
var count3kg = 0

while kg % 5 != 0 && kg > 2 {
    kg -= 3
    count3kg += 1
}

if kg <= 2 && kg != 0 {
    print(-1)
} else {
    count5kg = (kg / 5) + (count3kg / 5) * 3
    count3kg = count3kg % 5
    print(count5kg + count3kg)
}

