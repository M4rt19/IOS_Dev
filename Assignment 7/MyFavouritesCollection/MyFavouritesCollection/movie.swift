//
//  movie.swift
//  MyFavouritesCollection
//
//  Created by BMK on 24.10.2024.
//

import UIKit

struct Movie{
    let title: String
    let image: UIImage
}

let movies: [Movie] = [
    Movie(title: "Insomnia", image: #imageLiteral(resourceName: "1.jpg")),
    Movie(title: "Seven", image: #imageLiteral(resourceName: "2.jpg")),
    Movie(title: "Interstellar", image: #imageLiteral(resourceName: "3.jpg")),
    Movie(title: "Inception", image: #imageLiteral(resourceName: "4") ),
    Movie(title: "Tenet", image: #imageLiteral(resourceName: "5")),
    Movie(title: "The Dark Knight", image: #imageLiteral(resourceName: "6")),
    Movie(title: "The Green Mile", image: #imageLiteral(resourceName: "7")),
          Movie(title: "Pirates of the Caribbean: The Curse of the Black Pearl", image: #imageLiteral(resourceName: "8")),
    Movie(title: "The Fast and the Furious", image: #imageLiteral(resourceName: "9")),
    Movie(title: "Demolition", image: #imageLiteral(resourceName: "10"))
]
