//
//  WorkoutViewController.swift
//  FitApp
//
//  Created by BMK on 20.12.2024.
//

import UIKit

struct SetEx {
    var reps: Int
    var weight: Double
    
}

struct ExerciseDescription {
    var name: String
    var sets: [SetEx]
}

struct WorkoutExercise{
    var exercises: [ExerciseDescription]
}

class WorkoutViewController: UIViewController, passDataBack, passData{
    
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var Exercises: [String: [String]] = [:]
    var selectedSec: Int?
    var rowNmber: Int?
    var sectionNum: Int?
    
    var workouts: [String: [WorkoutExercise]] = [:] // Dictionary to store workouts by date
    var rememberWorkout: WorkoutExercise?
    var arrayOfExercises: [ExerciseDescription] = []
    var rememberExercise: ExerciseDescription?
    var sets: [SetEx] = []
    
    var curentDate: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //settings for the picture
        image.layer.cornerRadius = 15
        image.alpha = 0.4
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        
        //initilizing the tableview
        displayTable.delegate = self
        displayTable.dataSource = self
        
        let destVC = storyboard?.instantiateViewController(withIdentifier: "calendar") as! CalendarViewController
        curentDate = destVC.dateString!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add", let destinationVC = segue.destination as? ExersiceViewController {
            destinationVC.delegate = self // Set WorkoutViewController as the delegate of ExersiceViewController
        }
        
        if segue.identifier == "stat", let dest = segue.destination as? RepsViewController {
            dest.delegate = self
        }
        
    }
    
    // protocol for adding reps and weight to row
    func changeRow(reps: String, weight: String) {
        let keys = Array(Exercises.keys)
        let key = keys[selectedSec!]
        var values = Exercises[key]!
        values[rowNmber!] = "number of reps: \(reps), and  weight: \(weight) kg"
        Exercises[key] = values
        displayTable.reloadData()
    }
    


    
    // Protocol method to update the exercises
    func updateRow(exercises: [String: [String]]) {
        // Update the existing exercises, appending new data
        for (key, value) in exercises {
            if Exercises[key] == nil {
                Exercises[key] = []  // Create an empty array if the key doesn't exist
                rememberExercise = ExerciseDescription(name: key, sets: sets)
                arrayOfExercises.append(rememberExercise!)
                rememberWorkout = WorkoutExercise(exercises: arrayOfExercises)
                workouts[curentDate!]!.append(rememberWorkout!)
            }
            Exercises[key]?.append(contentsOf: value)  // Append the new exercises
        }
        displayTable.reloadData()
        
        print(workouts)
    }

    
    //add button
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: nil)
    }
    

    @IBOutlet weak var displayTable: UITableView!

    var reps: String!
    var weight: String!
    	

}
extension WorkoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSec = indexPath.section
        rowNmber = indexPath.row
        performSegue(withIdentifier: "stat", sender: nil)
        
    }
    
        
}



extension WorkoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = Array(Exercises.keys)
        return Exercises[keys[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keys = Array(Exercises.keys)
        return keys[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let keys = Array(Exercises.keys)
        let currentKey = keys[indexPath.section]
        let exerciseData = Exercises[currentKey] ?? []
        cell.textLabel?.text = exerciseData[indexPath.row]
        cell.textLabel?.textColor = .lightGray
        return cell
    }
}

