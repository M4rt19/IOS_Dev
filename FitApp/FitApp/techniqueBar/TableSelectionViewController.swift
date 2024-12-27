//
//  TableSelectionViewController.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//


import UIKit
struct GifExercise{
    let label: String
    let image: UIImage
    let gif: String
    
}



class TableSelectionViewController: UIViewController{

    
    var hands: [GifExercise] = [
        GifExercise(label: "Barbell Curls", image: .barbellCurl, gif: "Barbell Curls"),
        GifExercise(label: "Dumbbell Bicep Curls", image: .dumbbellBicepCurlsAlternatingOrBothArms, gif: "Dumbell Bicep Curls"),
        GifExercise(label: "Hammer Curls", image: .hammerCurls, gif: "Hammer Curls"),
        GifExercise(label: "Concentration Curls", image: .concentrationCurls, gif: "Concentration Curls"),
        GifExercise(label: "Cable Bicep Curls", image: .cableBicepCurls, gif: "Cable Bicep Curls"),
        GifExercise(label: "Chin-Ups", image: .chinUpsUnderhandGripFocusOnBiceps, gif: "Chin-Ups (underhand grip, focus on biceps)"),
        GifExercise(label: "Preacher Curls", image: .preacherCurls, gif: "Preacher Curls"),
        GifExercise(label: "Incline Dumbbell Curls", image: .inclineDumbbellCurls, gif: "Incline Dumbbell Curls"),
        GifExercise(label: "Tricep Dips", image: .tricepDipsBodyweightOrWeighted, gif: "Tricep Dips (bodyweight or weighted)"),
        GifExercise(label: "Skull Crushers", image: .skullCrushersEZBarOrDumbbells, gif: "Skull Crushers (EZ bar or dumbbells)"),
        GifExercise(label: "Overhead Tricep Extensions", image: .overheadTricepExtensionsDumbbellOrCable, gif: "Overhead Tricep Extensions (dumbbell or cable)"),
        GifExercise(label: "Close-Grip Bench Press", image: .closeGripBenchPress, gif: "Close-Grip Bench Press"),
        GifExercise(label: "Tricep Pushdowns", image: .tricepPushdownsWithCableMachineStraightBarOrRope, gif: "Tricep Pushdowns (with cable machine, straight bar, or rope)"),
        GifExercise(label: "Kickbacks", image: .kickbacksDumbbellsOrCables, gif: "Kickbacks (dumbbells or cables)"),
        GifExercise(label: "Diamond Push-Ups", image: .diamondPushUps, gif: "Diamond Push-Ups"),
        GifExercise(label: "Parallel Bar Dips", image: .parallelBarDips, gif: "Parallel Bar Dips"),
        GifExercise(label: "Wrist Curls", image: .wristCurlsBarbellOrDumbbell, gif: "Wrist Curls (barbell or dumbbell)"),
        GifExercise(label: "Reverse Wrist Curls", image: .reverseWristCurls, gif: "Reverse Wrist Curls"),
        GifExercise(label: "Farmer’s Walk", image: .farmerSWalkDumbbellsKettlebellsOrTrapBar, gif: "Farmer’s Walk (dumbbells, kettlebells, or trap bar)"),
        GifExercise(label: "Plate Pinches", image: .platePinch, gif: "Plate Pinches (grip training)"),
        GifExercise(label: "Dead Hangs", image: .deadHangsHangingFromAPullUpBar, gif: "Dead Hangs (hanging from a pull-up bar)"),
        GifExercise(label: "Reverse Barbell Curls", image: .reverseBarbellCurls, gif: "Reverse Barbell Curls"),
        GifExercise(label: "Towel Pull-Ups", image: .towelPullUpsForGripStrength, gif: "Towel Pull-Ups (for grip strength)"),
        GifExercise(label: "Zottman Curls", image: .zottmanCurls, gif: "Zottman Curls")
    ]

    var legs: [GifExercise] = [
        // Quads
        GifExercise(label: "Squats", image: .squatsBarbellDumbbellOrBodyweight, gif: "Hammer Curls"),
        GifExercise(label: "Leg Press", image: .legPress, gif: "Hammer Curls"),
        GifExercise(label: "Lunges", image: .lunges, gif: "Hammer Curls"),
        GifExercise(label: "Bulgarian Split Squats", image: .bulgarianSplitSquatWithChair, gif: "Hammer Curls"),
        GifExercise(label: "Step-Ups", image: .stepUpsWeightedOrUnweighted, gif: "Hammer Curls"),
        GifExercise(label: "Hack Squats", image: .hackSquats, gif: "Hammer Curls"),
        
        // Hamstrings
        GifExercise(label: "Romanian Deadlifts", image: .dumbbellRomanianDeadlift, gif: "Hammer Curls"),
        GifExercise(label: "Good Mornings", image: .goodMornings, gif: "Hammer Curls"),
        GifExercise(label: "Leg Curls", image: .leverLyingLegCurl, gif: "Hammer Curls"),
        GifExercise(label: "Glute-Ham Raises", image: .gluteHamRaiseThighsSmall, gif: "Hammer Curls"),
        GifExercise(label: "Sumo Deadlifts", image: .kettlebellSumoDeadlift, gif: "Hammer Curls"),
        
        // Calves
        GifExercise(label: "Standing Calf Raises", image: .bodyweightStandingCalfRaise, gif: "Hammer Curls"),
        GifExercise(label: "Seated Calf Raises", image: .dumbbellSeatedCalfRaise, gif: "Hammer Curls"),
        GifExercise(label: "Farmer’s Walk on Toes", image: .farmerSWalkOnToes, gif: "Hammer Curls"),
        GifExercise(label: "Donkey Calf Raises", image: .donkeyCalfRaiseGeraet, gif: "Hammer Curls"),
        
        // Glutes
        GifExercise(label: "Hip Thrusts", image: .dumbbellHipThrust, gif: "Hammer Curls")
    ]

    var chest: [GifExercise] = [
        GifExercise(label: "Flat Bench Press", image: .flatbencPress, gif: "Flat Bench Press (barbell or dumbbell)"),
        GifExercise(label: "Incline Bench Press", image: .inclineBenchPressBarbellOrDumbbell, gif: "Hammer Curls"),
        GifExercise(label: "Decline Bench Press", image: .declineBenchPress, gif: "Hammer Curls"),
        GifExercise(label: "Push-Ups", image: .pushUpsRegularWideGripDiamondOrWeighted, gif: "Hammer Curls"),
        GifExercise(label: "Chest Flys", image: .cableSeatedChestFly, gif: "Hammer Curls"),
        GifExercise(label: "Pec Deck Machine", image: .pecDeckMachine, gif: "Hammer Curls"),
        GifExercise(label: "Dips for Chest", image: .dipsForChestLeanForwardForChestEmphasis, gif: "Hammer Curls"),
        GifExercise(label: "Cable Crossovers", image: .cableCrossover, gif: "Hammer Curls")
    ]

    var back: [GifExercise] = [
        GifExercise(label: "Pull-Ups/Chin-Ups", image: .deadHangsHangingFromAPullUpBar, gif: "Hammer Curls"),
        GifExercise(label: "Barbell Deadlifts", image: .barbellDeadlifts, gif: "Hammer Curls"),
        GifExercise(label: "Barbell Rows", image: .barbellRowsUnderhandOrOverhandGrip, gif: "Hammer Curls"),
        GifExercise(label: "T-Bar Rows", image: .tBarRows, gif: "Hammer Curls"),
        GifExercise(label: "Lat Pulldowns", image: .latPulldownsWideGripOrCloseGrip, gif: "Hammer Curls"),
        GifExercise(label: "Dumbbell Rows", image: .dumbbellRomanianDeadlift, gif: "Hammer Curls"),
        GifExercise(label: "Seated Cable Rows", image: .seatedCableRow, gif: "Hammer Curls"),
        GifExercise(label: "Face Pulls", image: .facePullsForRearDeltsAndUpperBack, gif: "Hammer Curls"),
        GifExercise(label: "Good Mornings", image: .goodMornings, gif: "Hammer Curls"),
        GifExercise(label: "Hyperextensions", image: .hyperextension, gif: "Hammer Curls")
    ]

    var abs: [GifExercise] = [
        GifExercise(label: "Plank (standard, forearm, or side)", image: .plankStandardForearmOrSide, gif: "Hammer Curls"),
        GifExercise(label: "Dead Bug", image: .deadBug, gif: "Hammer Curls"),
        GifExercise(label: "Ab Wheel Rollouts", image: .abWheelRollOuts, gif: "Hammer Curls"),
        GifExercise(label: "V-Ups", image: .vUps, gif: "Hammer Curls"),
        GifExercise(label: "Dragon Flag", image: .dragonFlag, gif: "Hammer Curls"),
        GifExercise(label: "L-Sit (using parallel bars or ground)", image: .lSitUsingParallelBarsOrGround, gif: "Hammer Curls")
        
    ]
    
    var shoulders: [GifExercise] = [
        GifExercise(label: "Overhead Press (Barbell or Dumbbell)", image: .overheadPressBarbellOrDumbbell, gif: "Hammer Curls"),
        GifExercise(label: "Lateral Raise", image: .lateralRaise, gif: "Hammer Curls"),
        GifExercise(label: "Front Raise", image: .frontRaise, gif: "Hammer Curls"),
        GifExercise(label: "Rear Delt Fly (Reverse Fly)", image: .rearDeltFlyReverseFly, gif: "Hammer Curls"),
        GifExercise(label: "Arnold Press", image: .arnoldPress, gif: "Hammer Curls"),
        GifExercise(label: "Upright Row", image: .uprightRow, gif: "Hammer Curls"),
        GifExercise(label: "Face Pull", image: .facePull, gif: "Hammer Curls"),
        GifExercise(label: "Dumbbell Shrugs", image: .dumbbellShrugs, gif: "Hammer Curls"),
        GifExercise(label: "Push Press", image: .pushPress, gif: "Hammer Curls"),
        GifExercise(label: "Cable Lateral Raise", image: .cableLateralRaise, gif: "Hammer Curls")
    ]


    
    var exercisesGrouped: [[GifExercise]] {
        return [hands, legs, chest, back, abs, shoulders]
    }

    
    var selectedMuscle: Int = 0
    var selectedMuscleGif: GifExercise?
    
    @IBOutlet weak var GifTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initilizing the tableview
        GifTable.dataSource = self
        GifTable.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondGifViewController else{
            return
        }
        dest.configure(with: selectedMuscleGif!)
    }

    

}

extension TableSelectionViewController: UITableViewDelegate {
    
}

extension TableSelectionViewController: UITableViewDataSource {
    
    // number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesGrouped[selectedMuscle].count
    }
    
    // making the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellE", for: indexPath) as! SelectionTableViewCell
        
        cell.showButton.tag = indexPath.row
        cell.showButton.addTarget(self, action: #selector(doButton), for: .touchUpInside)
        
        let currentModel = exercisesGrouped[selectedMuscle][cell.showButton.tag]
        cell.configure(currentModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    @objc func doButton(_ sender: UIButton) {
        selectedMuscleGif = exercisesGrouped[selectedMuscle][sender.tag]
        performSegue(withIdentifier: "gifShow", sender: nil)
    }
}


