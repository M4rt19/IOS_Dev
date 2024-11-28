//
//  ViewController.swift
//  assignment11
//
//  Created by BMK on 27.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

struct Hero: Decodable{
    let name: String
    let images:Image
    let biography:Description
    let work: Work
    let powerstats:Powerstats
    
    struct Image: Decodable{
        let sm: String
    }
    
    struct Description: Decodable{
        let fullName: String
        let publisher: String?
    }
    
    struct Work: Decodable{
        let occupation: String?
    }
    struct Powerstats: Decodable{
        let intelligence: Int?
        let strength: Int?
        let speed: Int?
        let durability: Int?
        let power: Int?
        let combat: Int?
    }
    
}

class ViewController: UIViewController {
    
    let urlString = "https://akabab.github.io/superhero-api/api/all.json"
    
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var labelHero: UILabel!
    @IBOutlet weak var biographyHero: UILabel!
    @IBOutlet weak var publisherHero: UILabel!
    @IBOutlet weak var occupationHero: UILabel!
    @IBOutlet weak var charecteristicks: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var heroes:[Hero] = []

    @IBAction func getHero(_ sender: Any) {
        if heroes.isEmpty{
            AF.request(urlString).responseDecodable(of: [Hero].self) { response in
                switch response.result{
                case .success(let heroes):
                    self.heroes = heroes
                    let randomHero = heroes.randomElement()!
                    self.configure(hero: randomHero)
                    
                case .failure(let error):
                    print(error)
                }
            }
        
        }else{
            let randomHero = heroes.randomElement()!
            configure(hero: randomHero)
        }
    }
    
    func configure(hero: Hero) {
        self.imageHero.kf.setImage(with: URL(string : hero.images.sm))
        self.labelHero.text = hero.name
        self.biographyHero.text = hero.biography.fullName
        self.publisherHero.text = hero.biography.publisher ?? "Unknown Publisher"
        self.occupationHero.text = hero.work.occupation ?? "Unknown Occupation"
        self.charecteristicks.text = "int: \(hero.powerstats.intelligence ?? 0)\n, combat: \(hero.powerstats.combat ?? 0)\n, durability: \(hero.powerstats.durability ?? 0)\n, power: \(hero.powerstats.power ?? 0)\n, speed: \(hero.powerstats.speed ?? 0)\n, strength: \(hero.powerstats.strength ?? 0)"
    }
    
}

