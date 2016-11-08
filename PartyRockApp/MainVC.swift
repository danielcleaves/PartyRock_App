//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Daniel Cleaves on 11/7/16.
//  Copyright © 2016 Daniel Cleaves. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var partyRocks =  [PartyRock]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://shannonmariegd.com/wp-content/uploads/2013/03/Party-Rock-FINAL1.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "New Thang")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/J7MQDULNIdU/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/b/b7/Redfoo-Let's-Get-Ridiculous.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/XExH20lc9aY/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tffpUktXCNU?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j\" frameborder=\"0\" allowfullscreen></iframe", videoTitle: "Booty Man")

        let p5 = PartyRock(imageURL: "http://www.josepvinaixa.com/blog/wp-content/uploads/2015/07/Redfoo-Where-the-Sun-Goes-2015-1200x1200-Single.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TrVLu9p65a0?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where the Sun Goes")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        
    tableView.delegate = self
    tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
        
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
            
        } else {
        return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    
    

}

