//
//  SelectionTableViewCell.swift
//  FitApp
//
//  Created by BMK on 27.12.2024.
//

import UIKit

class SelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exerImage: UIImageView!
    @IBOutlet weak var exerLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ model: GifExercise) {
        exerLabel.text = model.label
        exerImage.image = model.image // Ensure the image is set
    }
    


}
