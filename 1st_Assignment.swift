// Step 1

let firstName: String = "Miras"
let secondName: String = "Begali"
let age: Int = 21
let birthYear: Int = 2002
let isStudent: Bool = true
let height = 1.85
let weight = 90
let bornIn: String = "Taldykorgan"

// Step 2

let hoobies: String = "Making money"
let numberOfHobbies: Int = 9
let favouriteNumber: Int = 10
let isHobbyCreative: Bool = true
let sport: String = "Volleybal"
let healpfulHobby = "running, walking, sometimes workout"

// Step 3

var summaryOfMyLifestory: String
if(isStudent){
    summaryOfMyLifestory = "My name is \(firstName) \(secondName). I'm \(age) old, I was born in \(bornIn) in \(birthYear). I am currently a student. I enjoy \(hoobies), because money gives me freedom of action. I love to play \(sport) because my height \(height)m. , I was a captain of the Almaty region \(sport) team, and time when I played was one of the best moments in my life. I have 5 hobbies in total, such as \(healpfulHobby). My favorite number is \(favouriteNumber)."
}
else{
    summaryOfMyLifestory = "My name is \(firstName) \(secondName). I'm \(age) old, I was born in \(bornIn) in \(birthYear). I enjoy \(hoobies), because money gives me freedom of action. I love to play \(sport) because my height \(height)m. , I was a captain of the Almaty region \(sport) team, and time when I played was one of the best moments in my life. I have 5 hobbies in total, such as \(healpfulHobby). My favorite number is \(favouriteNumber)."
}

// Step 4
print(summaryOfMyLifestory)

//Bonus

let futureGoals: String = "sought-after specialist"

print("I hope that in the future I will become a \(futureGoals) and that this course will open the way to my goal.")
