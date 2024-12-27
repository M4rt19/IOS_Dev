//
//  MuscleSelectionViewController.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//

import UIKit

class MuscleSelectionViewController: UIViewController {

    var selectedMuscle: Int? // Temporary property to hold the selected muscle index
    
    @IBOutlet weak var handsButton: UIButton!
    @IBOutlet weak var legsButton: UIButton!
    @IBOutlet weak var chestButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var absButton: UIButton!
    @IBOutlet weak var shouldersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handsButton.layer.cornerRadius = 12
        legsButton.layer.cornerRadius = 12
        chestButton.layer.cornerRadius = 12
        backButton.layer.cornerRadius = 12
        absButton.layer.cornerRadius = 12
        shouldersButton.layer.cornerRadius = 12
        
        handsButton.layer.borderWidth = 1
        legsButton.layer.borderWidth = 1
        chestButton.layer.borderWidth = 1
        backButton.layer.borderWidth = 1
        absButton.layer.borderWidth = 1
        shouldersButton.layer.borderWidth = 1
        
        handsButton.layer.borderColor = UIColor.black.cgColor
        legsButton.layer.borderColor = UIColor.black.cgColor
        chestButton.layer.borderColor = UIColor.black.cgColor
        backButton.layer.borderColor = UIColor.black.cgColor
        absButton.layer.borderColor = UIColor.black.cgColor
        shouldersButton.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    
    @IBAction func hands(_ sender: UIButton) {
        selectedMuscle = 0 // Hands
        performSegue(withIdentifier: "listGif", sender: self)
    }
    
    @IBAction func legs(_ sender: UIButton) {
        selectedMuscle = 1 // Legs
        performSegue(withIdentifier: "listGif", sender: self)
    }
    
    @IBAction func chest(_ sender: UIButton) {
        selectedMuscle = 2 // Chest
        performSegue(withIdentifier: "listGif", sender: self)
    }
    
    @IBAction func back(_ sender: UIButton) {
        selectedMuscle = 3 // Back
        performSegue(withIdentifier: "listGif", sender: self)
    }
    
    @IBAction func abs(_ sender: UIButton) {
        selectedMuscle = 4 // Abs
        performSegue(withIdentifier: "listGif", sender: self)
    }
    
    @IBAction func shoulders(_ sender: UIButton) {
        selectedMuscle = 5 // shoulders
        performSegue(withIdentifier: "listGif", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listGif",
           let destinationVC = segue.destination as? TableSelectionViewController {
            destinationVC.selectedMuscle = selectedMuscle ?? 0

        }
    }
    

   

}
