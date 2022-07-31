//
//  ViewController.swift
//  Reproductordemusica
//
//  Created by XCode on 09/01/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    @IBOutlet var table : UITableView!
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    

    func configureSongs() {
        songs.append(Song(name: "As the world caves in",
                          albumName: "Coldplay",
                          artistName: "Sarah Cothran",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Take me to church",
                          albumName: "Something",
                          artistName: "Hozier",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "La mitad",
                          albumName: "Album N 2",
                          artistName: "Camilo & Christian Nodal",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "As the world caves in",
                          albumName: "Coldplay",
                          artistName: "Sarah Cothran",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Take me to church",
                          albumName: "Something",
                          artistName: "Hozier",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "La mitad",
                          albumName: "Album N 2",
                          artistName: "Camilo & Christian Nodal",
                          imageName: "cover3",
                          trackName: "song3"))
    }


    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? DetailsViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
