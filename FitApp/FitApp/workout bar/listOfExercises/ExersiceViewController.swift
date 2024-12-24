//
//  ExersiceViewController.swift
//  FitApp
//
//  Created by BMK on 20.12.2024.
//

import UIKit

class ExersiceViewController: UIViewController, passDataBack {
    func updateRow(exercises: [String: [String]]) {
        delegate?.updateRow(exercises: exercises)
    }
    
    var delegate: passDataBack?
    var selectedMuscle: Int? // Temporary property to hold the selected muscle index
    
    @IBAction func hands(_ sender: UIButton) {
        selectedMuscle = 0 // Hands
        performSegue(withIdentifier: "list", sender: self)
    }
    
    @IBAction func legs(_ sender: UIButton) {
        selectedMuscle = 1 // Legs
        performSegue(withIdentifier: "list", sender: self)
    }
    
    @IBAction func chest(_ sender: UIButton) {
        selectedMuscle = 2 // Chest
        performSegue(withIdentifier: "list", sender: self)
    }
    
    @IBAction func back(_ sender: UIButton) {
        selectedMuscle = 3 // Back
        performSegue(withIdentifier: "list", sender: self)
    }
    
    @IBAction func abs(_ sender: UIButton) {
        selectedMuscle = 4 // Abs
        performSegue(withIdentifier: "list", sender: self)
    }
    
    @IBAction func shoulders(_ sender: UIButton) {
        selectedMuscle = 5 // shoulders
        performSegue(withIdentifier: "list", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "list",
           let destinationVC = segue.destination as? SecondExerViewController {
            destinationVC.selectedMuscle = selectedMuscle ?? 0
            destinationVC.delegate = self
        }
    }
    
    
}

