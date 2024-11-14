//
//  ViewControllerMusic.swift
//  moviesTop
//
//  Created by BMK on 12.11.2024.
//

import UIKit

struct Song{
    var title:String
    var poster:UIImage
    var description:String
}

class ViewControllerMusic: UIViewController {

    
    
    var songs:[Song] = [
        Song(
            title: "Miyagi & Andy Panda - Hajime",
            poster: .haj,
            description: "“Hajime” is “Sanavabich” and “Rapapam”, on the second one – “Lubi menya” and “I Got Love”. And there is also the single “#Tamada”, which did not make it onto any release, but sounded all summer from the windows of cars rushing by. MiyaGi & Endshpil are melodists of a high order."
            ),
        
        Song(
            title: "Индаблэк - Ледокол",
            poster: .led,
            description: "Just a good song from the past."
            ),
        
        Song(
            title: "Saluki - Огней",
            poster: .ogn,
            description: "Put everything aside and listen and you will understand"
            ),
        
        Song(
            title: "J. Cole - No Role Modelz",
            poster: .nor,
            description: "Just a good song from the past."
            ),
        
        Song(
            title: "Armich - Звук",
            poster: .zvu,
            description: "Take a break and listen"
            ),
        
        Song(
            title: "Keyshia Cole & P. Diddy - Last Night",
            poster: .las,
            description: "Despite what Diddy did the song is awesome"
            ),
        Song(
            title: "Arctic Monkey - Do I Wanna Know?",
            poster: .doi,
            description: "Turn on and enjoy"
            ),
        Song(
            title: "LUCAVEROS - Дом",
            poster: .dom,
            description: "Listen to what he says!"
            ),
        Song(
            title: "Tanir & Tyomcha feat. Mali - Кроме Нее",
            poster: .kro,
            description: "I have a good memories"
            )
    ]
    
    
    
    @IBOutlet weak var MusicTable: UITableView!
    
    var selectedSong: Song?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        MusicTable.dataSource = self
        MusicTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondViewControllerMusic else{
            return
        }
        dest.configureMusic(with: selectedSong)
    }
    
    
}

extension ViewControllerMusic: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    
extension ViewControllerMusic: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCellMusic
        cell.myButtonMusic.tag = indexPath.row
        cell.myButtonMusic.addTarget(self, action: #selector(doButton), for: .touchUpInside)
        let currentModel = songs[cell.myButtonMusic.tag]
        cell.configureMusic(currentModel)
            return cell
    }
    @objc func doButton(_ sender: UIButton){
        selectedSong = songs[sender.tag]
        performSegue(withIdentifier: "DetailMusic", sender: nil)
    }
}
