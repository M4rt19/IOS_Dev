//
//  TableViewCell.swift
//  moviesTop
//
//  Created by Student on 01.11.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var lablePoster: UILabel!
    @IBOutlet weak var myButton: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ model: Movie){
        imagePoster.image = model.poster
        lablePoster.text = model.title
    }
    

}
