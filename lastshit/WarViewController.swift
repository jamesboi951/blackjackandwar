//
//  WarViewController.swift
//  lastshit
//
//  Created by James Boisvert on 7/29/19.
//  Copyright © 2019 James Boisvert. All rights reserved.
//

import UIKit
import FirebaseDatabase

class WarViewController: UIViewController {
    
    var ref:DatabaseReference?
    
    @IBOutlet weak var player_card: UIImageView!
    
    @IBOutlet weak var cpu_card: UIImageView!
    
    @IBOutlet weak var players_card: UILabel!
    
    var p_card = String()
    var cp_card = String()
    
    var player_score = 0
    var cpu_score = 0
    var win = false
    var tie = false
    var card_array = ["two","three","four","five","six","seven","eight","nine","ten","king","queen","jack","ace"]
    
    func random_generator( arr: inout [String]) -> String {
        return arr.randomElement()!
    }
    
    func score_return(neo: String)-> Int{
        if(neo == "two"){
            return 2
        }
        else if(neo == "three"){
            return 3
        }
        else if(neo == "four"){
            return 4
        }
        else if(neo == "five"){
            return 5
        }
        else if(neo == "six"){
            return 6
        }
        else if(neo == "seven"){
            return 7
        }
        else if(neo == "eight"){
            return 8
        }
        else if(neo == "nine"){
            return 9
        }
        else if(neo == "ten"){
            return 10
        }
        else if(neo == "king"){
            return 13
        }
        else if(neo == "queen"){
            return 12
        }
        else if(neo == "jack"){
            return 11
        }
        else if(neo == "ace"){
            return 14
        }
        return 0
    }
    
    
    @IBAction func Deal(_ sender: Any) {
        let neo1 = random_generator(arr: &card_array)
        let neo2 = random_generator(arr: &card_array)
        player_score = score_return(neo: neo1)
        cpu_score = score_return(neo: neo2)
        player_card.image = UIImage(named: neo1)
        cpu_card.image = UIImage(named: neo2)
        if(player_score > cpu_score){
            win = true
            War_Total_Win_Count += 1
        ref?.child(name_track).child("Wins").child("War Win Count").setValue(War_Total_Win_Count)
            
            performSegue(withIdentifier: "Warsegue", sender: nil)
        }
        else if(player_score == cpu_score){
            tie = true
            performSegue(withIdentifier: "Warsegue", sender: nil)
        }
        else{
            War_Total_Loss_Count += 1
        ref?.child(name_track).child("Losses").child("War Loss Count").setValue(War_Total_Loss_Count)

            performSegue(withIdentifier: "Warsegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(tie){
            let celly = segue.destination as! WinScreenViewController
            celly.neo = "Even Cards!! It's a tie!"
        }
        else if(win){
            let celly = segue.destination as! WinScreenViewController
            celly.neo = "You Won!!!"
        }
        else{
            let celly = segue.destination as! WinScreenViewController
            celly.neo = "You Lost!!!"
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        players_card.text = p_card
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
