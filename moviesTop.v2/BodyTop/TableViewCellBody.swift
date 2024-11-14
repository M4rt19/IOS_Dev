//
//  TableViewCellBody.swift
//  moviesTop
//
//  Created by BMK on 13.11.2024.
//

import UIKit

class TableViewCellBody: UITableViewCell {
    
    @IBOutlet weak var bodyTitle: UILabel!
    @IBOutlet weak var bodyImage: UIImageView!
    @IBOutlet weak var bodyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureBody(_ model: Body){
        bodyImage.image = model.poster
        bodyTitle.text = model.title
    }
    
    

}
