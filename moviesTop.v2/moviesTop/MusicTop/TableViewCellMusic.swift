//
//  TableViewCellMusic.swift
//  moviesTop
//
//  Created by BMK on 12.11.2024.
//

import UIKit

class TableViewCellMusic: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var imagePosterMusic: UIImageView!
    @IBOutlet weak var myButtonMusic: UIButton!
    @IBOutlet weak var lablePosterMusic: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func configureMusic(_ model: Song){
        imagePosterMusic.image = model.poster
        lablePosterMusic.text = model.title
    }
}
