//Task 1
//
//for i in 1...100{
//    if(i % 15 == 0){
//        print ("FizzBuzz")
//    }
//    else if(i % 5 == 0){
//        print ("Buzz")
//    }
//    else if(i % 3 == 0){
//        print ("Fizz")
//    }
//    else{
//        print (i)
//    }
//}
//
//Task 2
//
//func isPrime(n: Int) -> Bool{
//    var checker: Bool = true
//    if(n == 1){
//        return false
//    }
//    for i in 2..<n {
//        if(n % i == 0){
//            checker = false
//        }
//    }
//    return checker
//}
//
//for i in 1...100{
//    if(isPrime(n: i)){
//        print (i)
//    }
//}
//
//Task 3
//
//func fromK(n: Double){
//    print("In Celsius:", n - 273.15)
//    print("In Kelvin:", (n - 273.15) * 1.8 + 32)
//}
//
//func fromC(n: Double){
//    print("In Kelvin:", n + 273.15)
//    print("In Fahrenheit:", n * 1.8 + 32)
//}
//
//func fromF(n: Double){
//    print("In Celsius:", (n - 32) / 1.8)
//    print("In Kelvin:", (n - 32) / 1.8 + 273.15)
//}
//
//print ("Please enter the temperature:")
//if let a = readLine(), let b = Double(a){
//    print("Please enter the unit K,C or F:")
//    if let c = readLine(){
//        switch c{
//        
//        case "K":
//            fromK(n: b)
//        case "C":
//            fromC(n: b)
//        case "F":
//            fromF(n: b)
//        default:
//            print("Invalid unit")
//        }
//    }
//    else{
//        print("Please enter the valid unit:")
//    }
//}
//else{
//    print("Invalid temperature input!")
//}
//
////Task 4
//
//var list: [String] = []
//
//func menu() {
//    print("Welcome to Shopping List Manager 2.0")
//    print("  Please enter the command:")
//    print("        1. Add Item")
//    print("        2. Remove Item")
//    print("        3. Display the Shopping List")
//    print("        4. Exit")
//}
//
//func add(to list: inout [String]) {
//    print("Please enter the item: ")
//    if let item = readLine() {
//        list.append(item)
//    } else {
//        print("Invalid input.")
//    }
//}
//
//func remove(from list: inout [String]) {
//    print("Please enter the item to remove: ")
//    if let itemToRemove = readLine() {
//        if let index = list.firstIndex(of: itemToRemove) {
//            list.remove(at: index)
//            print("Item removed successfully.")
//        } else {
//            print("Item not found.")
//        }
//    } else {
//        print("Invalid input.")
//    }
//}
//
//func display(list: [String]) {
//    if list.isEmpty {
//        print("Shopping list is empty.")
//    } else {
//        print("Shopping List:")
//        for item in list {
//            print(item)
//        }
//    }
//}
//
//var checker = true
//while checker {
//    menu()
//    var a = readLine()!
//    var b = Int(a)
//    switch b {
//    case 1:
//        add(to: &list)
//    case 2:
//        remove(from: &list)
//    case 3:
//        display(list: list)
//    case 4:
//        print("Exiting...")
//        checker = false
//    default:
//        print("Invalid command!")
//    }
//}
//print("Bye!")
//
////Task 5
//import Foundation
//
//func countWordFrequencies(in sentence: String) -> [String: Int] {
//    
//    // Разбиваем предложение на слова, игнорируя знаки препинания и регистр
//    let words = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters)
//        .filter { !$0.isEmpty }
//
//    var frequencyDictionary: [String: Int] = [:]
//
//    for word in words {
//        frequencyDictionary[word] = (frequencyDictionary[word] ?? 0) + 1
//    }
//
//    return frequencyDictionary
//}
//
//print("Input the sentence: ")
//let sentence = readLine() ?? ""
//let wordFrequencies = countWordFrequencies(in: sentence)
//
//for (word, frequency) in wordFrequencies {
//    print("\(word): \(frequency)")
//}
//
//
//Task 6
//func fibonacci(_ n: Int) -> [Int] {
//    var ans: [Int] = [0, 1]
//    if n <= 0{
//        return [];
//    }
//    else if n == 1{
//        return ans
//    }
//    else{
//        for i in 2...n{
//            ans.append(ans[i - 2] + ans[i - 1])
//        }
//    }
//    return ans
//}
//print("Please enter the number")
//if let a = readLine(), var b = Int(a) {
//    print(fibonacci(b))
//}
//else{
//    print("Invalid input!")
//}
//
//Task 7
//import Foundation
//
//func calculateGrade(score: Double, average: Double) -> String {
//    if score > average {
//        return "Above average"
//    } else if score < average {
//        return "Below average"
//    } else {
//        return "Average"
//    }
//}
//
//print("Enter the number of students:")
//let numStudents = Int(readLine()!)!
//
//var students: [String: Double] = [:]
//
//for _ in 0..<numStudents {
//    print("Enter the student's name:")
//    let name = readLine()!
//    print("Enter the student's score:")
//    let score = Double(readLine()!)!
//    students[name] = score
//}
//
//var totalScore = 0.0
//for (_, score) in students {
//    totalScore += score
//}
//
//let averageScore = totalScore / Double(students.count)
//
//var highestScore = 0.0
//var lowestScore = 1e9 + 10.0
//
//for (_, score) in students {
//    if score > highestScore {
//        highestScore = score
//    }
//    if score < lowestScore {
//        lowestScore = score
//    }
//}
//
//print("\nAverage score: \(averageScore)")
//print("Highest score: \(highestScore)")
//print("Lowest score: \(lowestScore)")
//
//for (name, score) in students {
//    print("\n\(name): \(score) - \(calculateGrade(score: score, average: averageScore))")
//}
//
//Task 8
//import Foundation
//func isPalindrome(_ text: String) -> Bool {
//    // Remove spaces, punctuation, and convert to lowercase
//    let cleanedText = text.lowercased()
//        .components(separatedBy: CharacterSet.punctuationCharacters)
//        .joined(separator: "")
//        .replacingOccurrences(of: " ", with: "")
//
//    return cleanedText == String(cleanedText.reversed())
//}
//
//// Example usage
//let inputString = readLine()! //"A man, a plan, a canal: Panama!"
//if isPalindrome(inputString) {
//    print("\"\(inputString)\" is a palindrome.")
//} else {
//    print("\"\(inputString)\" is not a palindrome.")
//}
//
//Task 9
//func add(num1: Double, num2: Double) -> Double {
//    return num1 + num2
//}
//
//func subtract(num1: Double, num2: Double) -> Double {
//    return num1 - num2
//}
//
//func multiply(num1: Double, num2: Double) -> Double {
//    return num1 * num2
//}
//
//func divide(num1: Double, num2: Double) -> Double? {
//    if num2 == 0
// {
//        print("Error: Cannot divide by zero")
//        return nil
//
//    } else {
//        return num1 / num2
//    }
//}
//
//func main() {
//    while true {
//        print("Enter the first number:")
//        let num1 = Double(readLine()!)!
//        print("Enter the second number:")
//        let num2 = Double(readLine()!)!
//
//        print("Choose an operation:")
//        print("1. Addition (+)")
//        print("2. Subtraction (-)")
//        print("3. Multiplication (*)")
//        print("4. Division (/)")
//        print("5. Exit")
//
//        if let choice = Int(readLine()!) {
//            switch choice {
//            case 1:
//
//                let result = add(num1: num1, num2: num2)
//                print("Result:", result)
//            case 2:
//                let result = subtract(num1: num1, num2: num2)
//                print("Result:", result)
//            case 3:
//                let result = multiply(num1: num1, num2: num2)
//                print("Result:", result)
//            case 4:
//                if let result = divide(num1: num1, num2: num2) {
//                    print("Result:", result)
//                }
//            case 5:
//                print("Exiting...")
//                return
//            default:
//                print("Invalid choice. Please try again.")
//            }
//        } else {
//            print("Invalid input. Please enter a number.")
//        }
//    }
//}
//
//main()

//Task 10
//func hasUniqueCharacters(_ text: String) -> Bool {
//    var characterSet = Set<Character>()
//    for character in text {
//        if characterSet.contains(character) {
//            return false
//        }
//        characterSet.insert(character)
//    }
//    return true
//}
//
//let inputString = "hello"
//if hasUniqueCharacters(inputString) {
//    print("\"\(inputString)\" has unique characters.")
//} else {
//    print("\"\(inputString)\" has duplicate characters.")
//}
