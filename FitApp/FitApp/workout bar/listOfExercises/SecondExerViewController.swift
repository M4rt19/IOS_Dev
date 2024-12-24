//
//  SecondExerViewController.swift
//  FitApp
//
//  Created by BMK on 21.12.2024.
//

import UIKit
struct Exercise{
    let lable: String
    let image: UIImage
}

protocol passDataBack{
    func updateRow(exercises: [String: [String]])
}


class SecondExerViewController: UIViewController{
    
    var delegate: passDataBack?
    
    //all exercises
    var hands: [Exercise] = [
        Exercise(lable: "Barbell Curls", image: .barbellCurl),
        Exercise(lable: "Dumbbell Bicep Curls", image: .dumbbellBicepCurlsAlternatingOrBothArms),
        Exercise(lable: "Hammer Curls", image: .hammerCurls),
        Exercise(lable: "Concentration Curls", image: .concentrationCurls),
        Exercise(lable: "Cable Bicep Curls", image: .cableBicepCurls),
        Exercise(lable: "Chin-Ups", image: .chinUpsUnderhandGripFocusOnBiceps),
        Exercise(lable: "Preacher Curls", image: .preacherCurls),
        Exercise(lable: "Incline Dumbbell Curls", image: .inclineDumbbellCurls),
        Exercise(lable: "Tricep Dips", image: .tricepDipsBodyweightOrWeighted),
        Exercise(lable: "Skull Crushers", image: .skullCrushersEZBarOrDumbbells),
        Exercise(lable: "Overhead Tricep Extensions", image: .overheadTricepExtensionsDumbbellOrCable),
        Exercise(lable: "Close-Grip Bench Press", image: .closeGripBenchPress),
        Exercise(lable: "Tricep Pushdowns", image: .tricepPushdownsWithCableMachineStraightBarOrRope),
        Exercise(lable: "Kickbacks", image: .kickbacksDumbbellsOrCables),
        Exercise(lable: "Diamond Push-Ups", image: .diamondPushUps),
        Exercise(lable: "Parallel Bar Dips", image: .parallelBarDips),
        Exercise(lable: "Wrist Curls", image: .wristCurlsBarbellOrDumbbell),
        Exercise(lable: "Reverse Wrist Curls", image: .reverseWristCurls),
        Exercise(lable: "Farmer’s Walk", image: .farmerSWalkDumbbellsKettlebellsOrTrapBar),
        Exercise(lable: "Plate Pinches", image: .manwork),
        Exercise(lable: "Dead Hangs", image: .deadHangsHangingFromAPullUpBar),
        Exercise(lable: "Reverse Barbell Curls", image: .reverseBarbellCurls),
        Exercise(lable: "Towel Pull-Ups", image: .towelPullUpsForGripStrength),
        Exercise(lable: "Zottman Curls", image: .zottmanCurls)
        
        
    ]
    var legs: [Exercise] = [
        // Quads
        Exercise(lable: "Squats", image: .squatsBarbellDumbbellOrBodyweight),
        Exercise(lable: "Leg Press", image: .legPress),
        Exercise(lable: "Lunges", image: .lunges),
        Exercise(lable: "Bulgarian Split Squats", image: .bulgarianSplitSquatWithChair),
        Exercise(lable: "Step-Ups", image: .stepUpsWeightedOrUnweighted),
                 Exercise(lable: "Hack Squats", image: .hackSquats),
                
                // Hamstrings
        Exercise(lable: "Romanian Deadlifts", image: .dumbbellRomanianDeadlift),
        Exercise(lable: "Good Mornings", image: .goodMornings),
        Exercise(lable: "Leg Curls", image: .leverLyingLegCurl),
        Exercise(lable: "Glute-Ham Raises", image: .gluteHamRaiseThighsSmall),
        Exercise(lable: "Sumo Deadlifts", image: .kettlebellSumoDeadlift),
                
                // Calves
        Exercise(lable: "Standing Calf Raises", image: .bodyweightStandingCalfRaise),
        Exercise(lable: "Seated Calf Raises", image: .dumbbellSeatedCalfRaise),
        Exercise(lable: "Farmer’s Walk on Toes", image: .farmerSWalkOnToes),
        Exercise(lable: "Donkey Calf Raises", image: .donkeyCalfRaiseGeraet),
                
                // Glutes
        Exercise(lable: "Hip Thrusts", image: .dumbbellHipThrust),
        Exercise(lable: "Glute Bridges", image: .gluteBridges),
        Exercise(lable: "Cable Kickbacks", image: .cableKickbacks),
        Exercise(lable: "Sumo Squats", image: .sumoSquat)
        
    ]
    var chest: [Exercise] = [
        Exercise(lable: "Flat Bench Press", image: .flatBenchPressBarbellOrDumbbell),
        Exercise(lable: "Incline Bench Press", image: .inclineBenchPressBarbellOrDumbbell),
        Exercise(lable: "Decline Bench Press", image: .declineBenchPress),
                 Exercise(lable: "Push-Ups", image: .pushUpsRegularWideGripDiamondOrWeighted),
                 Exercise(lable: "Chest Flys", image: .cableSeatedChestFly),
                 Exercise(lable: "Pec Deck Machine", image: .pecDeckMachine),
                 Exercise(lable: "Dips for Chest", image: .dipsForChestLeanForwardForChestEmphasis),
                 Exercise(lable: "Cable Crossovers", image: .cableCrossover)
    ]
    var back: [Exercise] = [
        Exercise(lable: "Pull-Ups/Chin-Ups", image: .deadHangsHangingFromAPullUpBar),
        Exercise(lable: "Barbell Deadlifts", image: .barbellDeadlifts),
        Exercise(lable: "Barbell Rows", image: .barbellRowsUnderhandOrOverhandGrip),
        Exercise(lable: "T-Bar Rows", image: .tBarRows),
                 Exercise(lable: "Lat Pulldowns", image: .latPulldownsWideGripOrCloseGrip),
                 Exercise(lable: "Dumbbell Rows", image: .dumbbellRomanianDeadlift),
                 Exercise(lable: "Seated Cable Rows", image: .seatedCableRow),
                 Exercise(lable: "Face Pulls", image: .facePullsForRearDeltsAndUpperBack),
                 Exercise(lable: "Good Mornings", image: .goodMornings),
        Exercise(lable: "Hyperextensions", image: .manwork)
        
    ]
    var abs: [Exercise] = [
        Exercise(lable: "Plank (standard, forearm, or side)", image: .manwork),
        Exercise(lable: "Dead Bug", image: .manwork),
        Exercise(lable: "Ab Wheel Rollouts", image: .manwork),
        Exercise(lable: "V-Ups", image: .bxBulb),
        Exercise(lable: "Dragon Flag", image: .bxBulb),
        Exercise(lable: "L-Sit (using parallel bars or ground)", image: .bxBulb)
        
    ]
    
    var shoulders: [Exercise] = [
        Exercise(lable: "Overhead Press (Barbell or Dumbbell)", image: .manwork),
        Exercise(lable: "Lateral Raise", image: .manwork),
        Exercise(lable: "Front Raise", image: .manwork),
        Exercise(lable: "Rear Delt Fly (Reverse Fly)", image: .bxBulb),
        Exercise(lable: "Arnold Press", image: .bxBulb),
        Exercise(lable: "Upright Row", image: .bxBulb),
        Exercise(lable: "Face Pull", image: .manwork),
        Exercise(lable: "Dumbbell Shrugs", image: .bxBulb),
        Exercise(lable: "Push Press", image: .bxBulb),
        Exercise(lable: "Cable Lateral Raise", image: .bxBulb)
    ]

    
    var exercisesGrouped: [[Exercise]] {
        return [hands, legs, chest, back, abs, shoulders]
    }

    
    var selectedMuscle: Int = 0
    
    var selectedExercise: [String: [String]] = [:]
    
    @IBOutlet weak var exerciseTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initilizing the tableview
        exerciseTable.dataSource = self
        exerciseTable.delegate = self
        
        
    }
    
    let basicText: String = "Enter the number of weights and reps"
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        // here we find selected rows and append them to another list
        if let selectedRows = exerciseTable.indexPathsForSelectedRows {
            for iPath in selectedRows{
                let choosenExercise: String = exercisesGrouped[selectedMuscle][iPath.row].lable
                if selectedExercise[choosenExercise] == nil {
                    selectedExercise[choosenExercise] = []
                }
                selectedExercise[choosenExercise]?.append(basicText)
                selectedExercise[choosenExercise]?.append(basicText)
                selectedExercise[choosenExercise]?.append(basicText)
                
                
            }
        }
        
        //call the delegate
        delegate?.updateRow(exercises: selectedExercise)
        
        // This lines of code find 2 step back view cotroller and go there
        if let viewControllers = self.navigationController?.viewControllers,
           viewControllers.count >= 3 {
            let previousVC = viewControllers[viewControllers.count - 3]
            self.navigationController?.popToViewController(previousVC, animated: true)
        }
        
    }
    

}

extension SecondExerViewController: UITableViewDelegate {
    
}

extension SecondExerViewController: UITableViewDataSource {
    
    // number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesGrouped[selectedMuscle].count
    }
    
    // making the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SecondExerTableViewCell
        let currentModel = exercisesGrouped[selectedMuscle][indexPath.row]
        cell.configure(currentModel)
        return cell
    }
    
    //perform some actions if selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exerciseTable.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    //perform actions when deselected
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        exerciseTable.cellForRow(at: indexPath)?.accessoryType = .none
    }
}



