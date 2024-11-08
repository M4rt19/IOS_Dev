//
//  ViewController.swift
//  moviesTop
//
//  Created by Student on 01.11.2024.
//

import UIKit

struct Movie{
    var title:String
    var poster:UIImage
    var description:String
}

class ViewController: UIViewController {
    
    
    
    var movies:[Movie] = [
        Movie(
            title: "Deadpool",
            poster: .dead,
            description: "Wade Wilson is a mercenary. A byproduct of the military's Weapon X program, Wilson has incredible strength, agility, and healing powers. But at a terrible cost: his cellular structure is constantly changing, and his sanity is questionable. All Wilson wants to do is stay afloat in a social cesspool. But the current is too fast."
            ),
        
        Movie(
            title: "Ant Man",
            poster: .ant,
            description: "Armed with the amazing ability to shrink in size but gain great strength, rogue Scott Lang must become a hero and help his mentor Dr. Hank Pym keep the Ant-Man suit a secret from a new generation of threats."
            ),
        
        Movie(
            title: "Avengers",
            poster: .aven,
            description: "Thor's half-brother Loki is back, and this time he's not alone. Earth is on the brink of enslavement, and only the best of the best can save humanity. Nick Fury, the head of the international organization S.H.I.E.L.D., gathers outstanding champions of justice and goodness to repel the attack. Led by Captain America, Iron Man, Thor, the Incredible Hulk, Hawkeye, and Black Widow enter the war against the invader."
            ),
        
        Movie(
            title: "Thor",
            poster: .thor,
            description: "An epic adventure set on both our planet Earth and the kingdom of the gods, Asgard, the story centers on the mighty Thor, a powerful but arrogant warrior whose reckless actions reignite an ancient war in Asgard. Thor is exiled to Earth, stripped of his powers, and forced to live among ordinary people as punishment..."
            ),
        
        Movie(
            title: "Guardians of the Galaxy",
            poster: .galaxy,
            description: "Intrepid adventurer Peter Quill comes into contact with a mysterious artifact belonging to the powerful and ruthless villain Ronan, who is plotting to take over the universe. Peter finds himself in the center of an intergalactic hunt, where he is the prey. The only way to save his life is to team up with four unsociable outcasts: a belligerent raccoon named Rocket, a human-like tree Groot, a deadly Gamora, and a vengeful Drax, also known as the Destroyer. When Quill realizes the power of the stolen artifact and the danger it poses to the universe, the loner will do anything to unite unlikely allies for a decisive battle for the fate of the galaxy."
            ),
        
        Movie(
            title: "Inception",
            poster: .incep,
            description: "Inception is a 2010 science fiction action heist film[4][5][6][7] written and directed by Christopher Nolan, who also produced it with Emma Thomas, his wife. The film stars Leonardo DiCaprio as a professional thief who steals information by infiltrating the subconscious of his targets. He is offered a chance to have his criminal history erased as payment for the implantation of another person's idea into a target's subconscious.[8] The ensemble cast includes Ken Watanabe, Joseph Gordon-Levitt, Marion Cotillard, Elliot Page,[a] Tom Hardy, Cillian Murphy, Tom Berenger, Dileep Rao, and Michael Caine."
            ),
        Movie(
            title: "Twilight",
            poster: .twil,
            description: "Seventeen-year-old Bella moves to her father's place in the small town of Forks. She falls in love with a mysterious classmate who, as it turns out, comes from a family of vampires who have given up attacking people. To fall in love with a vampire. Is it scary? It's romantic, it's wonderful and painful, but it can't end well, especially in the eternal confrontation of vampire clans, where the slightest difference from others already turns you into an enemy."
            ),
        Movie(
            title: "Venom",
            poster: .venom,
            description: "What if one day a symbiote enters you and gives you superhuman abilities? But Venom is a very unkind symbiote, and it is impossible to negotiate with him. But is it necessary to negotiate? After all, at some point you understand that being bad is not so bad, it’s even more fun. And there are already too many superheroes in the world."
            ),
        Movie(
            title: "Uncharted",
            poster: .unch,
            description: "Nathan Drake hasn't seen his older brother Sam for 15 years, since he ran away from an orphanage. The guy works as a bartender and makes a living as a petty thief when Victor Sullivan, nicknamed Sully, approaches him and offers to go in search of Magellan's long-lost treasure. Having learned that Sully knows Sam, Nathan agrees to the adventure, hoping to also find his brother."
            )
    ]
    
    
    
    
    
    

    
    @IBOutlet weak var tablePoster: UITableView!
    
    
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablePoster.dataSource = self
        tablePoster.delegate = self
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondViewController else{
            return
        }
        dest.configure(with: selectedMovie)
    }

    
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(doButton), for: .touchUpInside)
        let currentModel = movies[cell.myButton.tag]
        cell.configure(currentModel)
            return cell
    }
    
    @objc func doButton(_ sender: UIButton){
        selectedMovie = movies[sender.tag]
        performSegue(withIdentifier: "Detail", sender: nil)
    }
}


