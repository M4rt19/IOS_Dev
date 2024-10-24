//
//  MovieCollectionViewCell.swift
//  MyFavouritesCollection
//
//  Created by BMK on 24.10.2024.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with movie: Movie){
        movieImageView.image = movie.image
        titleLabel.text = movie.title
    }
}
