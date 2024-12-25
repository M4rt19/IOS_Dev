//
//  WorkoutViewController.swift
//  FitApp
//
//  Created by BMK on 20.12.2024.
//

import UIKit

struct SetEx: Codable {
    var reps: Int
    var weight: Double
    
}

struct ExerciseDescription: Codable {
    var name: String
    var sets: [SetEx]
}

struct WorkoutExercise: Codable{
    var exercises: [ExerciseDescription]
}


class WorkoutViewController: UIViewController, passDataBack, passData{
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    
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
        
        date.text = curentDate
        
        loadWorkouts()
        
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
        workout.sets[rowNmber]=(newSet) // Append instead of overwriting

        // Update the workout in `workouts`
        currentWorkouts.exercises[selectedSec] = workout
        workouts[currentDate] = currentWorkouts

        // Update the Exercises dictionary for display
        

        // Reload the table view
        displayTable.reloadData()
        saveWorkouts()

        print("Updated workouts:", workouts)
        
    }
    
    
    
    
    func deleteRow() {
        guard let currentDate = curentDate,
                  let selectedSec = selectedSec,
                  let rowNmber = rowNmber else {
                print("Error: Missing required parameters for deleting sets.")
                return
            }
            
            // Ensure the workouts dictionary contains the current date
            guard var currentWorkouts = workouts[currentDate] else {
                print("Error: No workouts found for the current date.")
                return
            }
            
            // Get the selected workout exercise
            var workoutExercise = currentWorkouts.exercises[selectedSec]
            
            // Check if the row number is valid
            if rowNmber < workoutExercise.sets.count {
                // Remove the set from the sets array
                workoutExercise.sets.remove(at: rowNmber)
                
                // Update the exercise with the modified sets array
                currentWorkouts.exercises[selectedSec] = workoutExercise
                
                // Update the workouts dictionary
                workouts[currentDate] = currentWorkouts
                
                // Reload the table view to reflect the removed set
                displayTable.reloadData()
                
                // Save the updated workouts to UserDefaults
                saveWorkouts()
                
                print("Set removed successfully!")
            } else {
                print("Error: Invalid row number.")
            }
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
                let inter:[SetEx] = [SetEx(reps: 0, weight: 0), SetEx(reps: 0, weight: 0),SetEx(reps: 0, weight: 0)]
                // Create a new ExerciseDescription and WorkoutExercise
                let newExercise = ExerciseDescription(name: key, sets: inter)
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
        saveWorkouts()
    }


    
    //add button
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: nil)
    }
    

    @IBOutlet weak var displayTable: UITableView!

    var reps: String!
    var weight: String!
    
    @objc func buttonTapped(sender: UIButton){
        // Ensure we have valid current date, selected section, and row number
            guard
                  let currentDate = curentDate else {
                print("Error: Missing selected section or current date.")
                return
            }
        
            selectedSec = sender.tag

            // Ensure the workouts dictionary contains the current date
            guard var currentWorkouts = workouts[currentDate] else {
                print("Error: No workouts found for the current date.")
                return
            }
        
        // Get the selected workout exercise
        var workoutExercise = currentWorkouts.exercises[selectedSec!]

            // Create a new SetEx (initializing with default values for reps and weight)
            let newSet = SetEx(reps: 0, weight: 0.0)

            // Append the new set to the exercise's sets array
            workoutExercise.sets.append(newSet)

            // Update the workout in the workouts dictionary
        currentWorkouts.exercises[selectedSec!] = workoutExercise
            workouts[currentDate] = currentWorkouts

            // Reload the table view to reflect the added set
            displayTable.reloadData()

            // Save the updated workouts to UserDefaults
            saveWorkouts()

    }
    	

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
    
    // Number of sections corresponds to the number of exercises in the current workout
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let currentDate = curentDate, let currentWorkout = workouts[currentDate] else {
            return 0 // No workouts for the selected date
        }
        return currentWorkout.exercises.count
    }
    
    // Number of rows in each section corresponds to the number of sets for a given exercise
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentDate = curentDate, let currentWorkout = workouts[currentDate] else {
            return 0
        }
        return currentWorkout.exercises[section].sets.count
    }
    
    // Title for each section is the name of the exercise
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let currentDate = curentDate, let currentWorkout = workouts[currentDate] else {
            return nil
        }
        
        let view = UIView()
        
        let label = UILabel()
        label.text = currentWorkout.exercises[section].name
        label.frame = CGRect(x: 5, y: 5, width: 270, height: 35)
        view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("+", for: .normal) // Set the title for the button
        button.frame = CGRect(x: 330, y: 12, width: 30, height: 20)// Set the button's position and size
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue // Set the background color
        button.setTitleColor(.white, for: .normal) // Set the title color
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        view.addSubview(button)
        button.tag = section
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // Configure each cell to display set details (e.g., reps and weight)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let currentDate = curentDate, let currentWorkout = workouts[currentDate] else {
            cell.textLabel?.text = "No data"
            return cell
        }
        
        let exercise = currentWorkout.exercises[indexPath.section]
        let set = exercise.sets[indexPath.row]
        cell.textLabel?.text = "Reps: \(set.reps), Weight: \(set.weight) kg"
        cell.textLabel?.textColor = .lightGray
        
        return cell
    }
}


extension WorkoutViewController {
    func saveWorkouts() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(workouts)
            UserDefaults.standard.set(data, forKey: curentDate!)
            print("Workouts saved successfully!")
        } catch {
            print("Error saving workouts: \(error.localizedDescription)")
        }
    }
}

extension WorkoutViewController {
    func loadWorkouts() {
        guard let data = UserDefaults.standard.data(forKey: curentDate!) else {
            print("No saved workouts found")
            return
        }

        do {
            let decoder = JSONDecoder()
            workouts = try decoder.decode([String: WorkoutExercise].self, from: data)
            
            print("Workouts loaded successfully!")
        } catch {
            print("Error loading workouts: \(error.localizedDescription)")
        }
    }
}



