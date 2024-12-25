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
    
    var workouts: [String: WorkoutExercise] = [:] // Dictionary to store workouts by date
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
        
        if let date = curentDate {
                print("Current date received: \(date)")
            } else {
                print("No date received.")
            }
        
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
        // Ensure `selectedSec`, `rowNmber`, and `curentDate` are valid
        guard let selectedSec = selectedSec,
              let rowNmber = rowNmber,
              let currentDate = curentDate else {
            print("Error: Missing required parameters for updating sets.")
            return
        }

        // Ensure the date exists in `workouts`
        guard var currentWorkouts = workouts[currentDate] else {
            print("Error: No workouts found for the current date.")
            return
        }

        // Get the workout for the selected section
        var workout = currentWorkouts.exercises[selectedSec]

        // Parse reps and weight into appropriate types
        guard let repsInt = Int(reps), let weightDouble = Double(weight) else {
            print("Error: Invalid input for reps or weight.")
            return
        }

        // Append a new set to the exercise
        let newSet = SetEx(reps: repsInt, weight: weightDouble)
        workout.sets.append(newSet) // Append instead of overwriting

        // Update the workout in `workouts`
        currentWorkouts.exercises[selectedSec] = workout
        workouts[currentDate] = currentWorkouts

        // Update the Exercises dictionary for display
        let keys = Array(Exercises.keys)
        let key = keys[selectedSec]
        if var values = Exercises[key] {
            values[rowNmber] = "number of reps: \(reps), and  weight: \(weight) kg"
            Exercises[key] = values
        }

        // Reload the table view
        displayTable.reloadData()

        print("Updated workouts:", workouts)
    }


    


    
    // Protocol method to update the exercises
    func updateRow(exercises: [String: [String]]) {
        // Ensure curentDate is not nil
        guard let currentDate = curentDate else {
            print("Error: curentDate is nil.")
            return
        }

    

        // Loop through exercises to update the data
        for (key, value) in exercises {
            if Exercises[key] == nil {
                Exercises[key] = [] // Initialize the Exercises array if needed
                
                // Create a new ExerciseDescription and WorkoutExercise
                let newExercise = ExerciseDescription(name: key, sets: sets)
                arrayOfExercises.append(newExercise)
                rememberWorkout = WorkoutExercise(exercises: arrayOfExercises)
                
                // Add the workout to the current date
                workouts[currentDate] = rememberWorkout
            }
            
            // Append new exercise details
            Exercises[key]?.append(contentsOf: value)
        }
        
        displayTable.reloadData()
        print("Workouts updated:", workouts)
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
        print(selectedSec as Any, rowNmber as Any)
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

