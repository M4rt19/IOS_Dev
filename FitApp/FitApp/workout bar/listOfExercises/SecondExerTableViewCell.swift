//
//  SecondExerTableViewCell.swift
//  FitApp
//
//  Created by BMK on 21.12.2024.
//

import UIKit

class SecondExerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exerImage: UIImageView!
    @IBOutlet weak var exerLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ model: Exercise) {
        exerLabel.text = model.lable
        exerImage.image = model.image // Ensure the image is set
    }


}
