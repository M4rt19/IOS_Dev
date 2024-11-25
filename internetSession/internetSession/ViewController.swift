//
//  ViewController.swift
//  internetSession
//
//  Created by BMK on 20.11.2024.
//

import UIKit

struct Hero: Decodable {
    let name: String
    let biography:FullName
    let images:Image
    let powerstats:Skills
    
    struct Skills: Decodable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct FullName: Decodable {
        let fullName: String
    }
    
    struct Image: Decodable{
        let sm: String
    }
    
    
    
}

class ViewController: UIViewController {
    
    let urlString = "https://akabab.github.io/superhero-api/api/all.json"
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UILabel!
    @IBOutlet weak var heroStats: UILabel!
    @IBOutlet weak var heroGender: UILabel!
    @IBOutlet weak var heroRace: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showHero(_ sender: UIButton) {
        guard let url = URL(string: urlString)else {return}
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            if let error{
                print(error)
            }else{
                let randomHero = Int.random(in: 0...563)
                do{
                    let heroes = try JSONDecoder().decode([Hero].self, from: data!)
                    
                    let imageString = heroes[randomHero].images.sm
                    let imageUrl = URL(string: imageString)
                    guard let imageData = try? Data(contentsOf: imageUrl!)else {return}
                    DispatchQueue.main.async {
                        self.heroName.text = heroes[randomHero].name
                        self.heroDescription.text = heroes[randomHero].biography.fullName
                        self.heroStats.text = heroes[randomHero].powerstats.intelligence
                        self.heroImage.image = UIImage(data: imageData)
                        
                       
                    }
                }catch{
                    print("Error occured")
                }
                
                
                
            }
        }
        task.resume()
    }
    


}

