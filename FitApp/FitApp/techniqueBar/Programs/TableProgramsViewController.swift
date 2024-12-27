//
//  TableProgramsViewController.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//

import UIKit

struct Program {
    let name: String
    let description: String
}

class TableProgramsViewController: UIViewController {
    
    var Programs:[Program] = [
        Program(name: "Full-Body Workout", description: """
Description: A full-body workout targets all major muscle groups in a single session. It's a time-efficient way to train and can be performed several times per week. This type of workout is suitable for beginners, as it provides balanced strength development.

Structure: Exercises are generally compound movements like squats, deadlifts, presses, and pulls, which engage multiple muscle groups at once.

Frequency: Typically 3 times per week (e.g., Monday, Wednesday, Friday).
"""),
        Program(name: "Upper-Lower Split", description: """
Description: The workout program is divided into two main categories: upper body and lower body. Upper body days focus on exercises for the chest, back, shoulders, and arms, while lower body days target the legs, glutes, and calves.

Structure: It is a balanced split that gives each muscle group enough recovery time between workouts.

Frequency: 4 days a week (e.g., Upper on Monday and Thursday, Lower on Tuesday and Friday).
"""),
        Program(name: "Push-Pull-Legs Split", description: """
Description: This is a more advanced workout split where the program is divided into three types of movements:

Push: Exercises that involve pushing movements (e.g., chest, shoulders, triceps).

Pull: Exercises that involve pulling movements (e.g., back, biceps).

Legs: Exercises for the lower body (e.g., quads, hamstrings, glutes).

Structure: This split ensures that muscles are given sufficient rest between workouts.

Frequency: Can be performed 3-6 times per week, depending on how many days you train.
"""),
        Program(name: "Bodyweight Training", description: """
Description: This program relies on exercises that use only the body for resistance, making it a great option for beginners or those who want to train at home. Common exercises include push-ups, pull-ups, squats, lunges, and planks.

Structure: Focuses on functional movements that engage multiple muscle groups.

"""),
        Program(name: "Strength Training (Powerlifting)", description: """
Description: Powerlifting focuses on maximal strength in three primary lifts: squat, bench press, and deadlift. It's great for building raw strength and increasing muscle mass.

Structure: The program revolves around heavy, compound lifts, typically with lower repetitions (1-5 reps) and high sets.

Frequency: Usually 3-4 days a week, with emphasis on strength progression.

"""),
        Program(name: "Hypertrophy Training (Bodybuilding)", description: """
Description: Hypertrophy training focuses on building muscle mass (size) rather than raw strength. It involves higher repetition ranges (6-12 reps) with moderate weight.

Structure: Programs often include isolation exercises in addition to compound lifts. It is more focused on volume, frequency, and time under tension.

Frequency: Typically 4-6 days per week with splits that focus on specific muscle groups.

"""
),
        
        Program(name: "Flexibility & Mobility Training", description: """
Description: This type of workout focuses on improving range of motion, flexibility, and joint mobility. It’s particularly useful for injury prevention, recovery, and improving overall movement patterns.

Structure: Includes static stretching, dynamic stretching, yoga, or mobility drills.

Frequency: Typically 3-5 times a week, depending on flexibility and mobility goals.

"""
),
        
        Program(name: " High-Intensity Interval Training (HIIT)", description: """
Description: HIIT is a cardiovascular workout that alternates between short bursts of intense activity and periods of rest or low-intensity activity. It's highly effective for fat loss and improving cardiovascular fitness.

Structure: Short, intense intervals of exercise followed by rest or active recovery periods.

Frequency: 2-3 times per week for best results.
"""
),
    ]
    
    var selectedMuscle:Int?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    

    
}
extension TableProgramsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TableProgramsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progCell", for: indexPath) as! ProgramsTableViewCell
        
        let currentModel = Programs[selectedMuscle!]
        cell.configure(currentModel)
        return cell
    }
    
    
    
}

