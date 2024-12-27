//
//  ProgramsTableViewCell.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//

import UIKit

class ProgramsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var programNameLabel: UILabel!
    @IBOutlet weak var programDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ model: Program){
        programNameLabel.text = model.name
        programDescriptionLabel.text = model.description
    }

}
