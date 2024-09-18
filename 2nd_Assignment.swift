//Easy mode

//Step 1
let fruits: [String] = ["Apple", "Pitaya", "Mango", "Passion Fruit", "Papaya"]
print(fruits[3])

//Step 2
var numb: [Int] = [1,2]
var favNumb: Array<Int> = [3,5,7,9]
favNumb.append(11)
print(favNumb)

//Step 3
var languages: Dictionary <String, Int> = ["C++" : 1980, "GoLang" : 2009]
languages["Swi"] = 1973
print(languages)
print(languages["Swi"]!)

//Step4
var colors: Array<String> = ["Red", "Blue", "Yellow", "Black"]
colors.remove(at:1)
print(colors)
colors.insert("Green", at: 1)
print(colors)

//Medium mode

//Step1
var numbers: Set<Int> = [1,2,3,4]
var numbers2: Set<Int> = [3,4,5,6]
print(numbers.intersection(numbers2))

//Step2
var grades: Dictionary<String, Int> = ["Miras" : 99, "Ali" : 88, "Adil" : 77]
grades.updateValue(80, forKey: "Ali")
print(grades)

//Step3
var fruitss: [String] = ["Banana", "Apple"]
let arr: Array<String> = ["Cherry", "Data"]
fruitss += arr
print(fruitss)

//Hard mode

//Step1
var countries: Dictionary <String, Int> = ["France" : 100, "Germany" : 200, "Italy" : 50]
countries["Spain"] = 300
print(countries)

//Step2
var arr1: Set<String> = ["Cat", "Dog"]
var arr2: Set<String> = ["Dog", "Mouse"]
var arr3 = arr1.union(arr2)
var arr4 = arr3.subtracting(arr2)
print(arr4)
print((arr1.union(arr2)).subtracting(arr2))

//Step3
var gradess : Dictionary<String, Array<Int>> = ["Miras" : [99,88,77], "Ali" : [88,77,66], "Adil" : [77,66,55]]
print((gradess["Miras"]!)[1])
print((gradess["Adil"]!)[1])
