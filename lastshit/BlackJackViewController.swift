//
//  BlackJackViewController.swift
//  lastshit
//
//  Created by James Boisvert on 7/24/19.
//  Copyright © 2019 James Boisvert. All rights reserved.
//

import UIKit
import FirebaseDatabase

class BlackJackViewController: UIViewController {
    
    var ref:DatabaseReference?
    
    
    @IBOutlet weak var p1_cards: UILabel!
    
    
    @IBOutlet weak var p1_score: UILabel!
    
    @IBOutlet weak var p2_cards: UILabel!
    
    @IBOutlet weak var p2_score: UILabel!
    
    
    
    var p1_score_count = 0
    var cpu_score = 0
    
    var player_name = String()
    
    var win = false
    
    var bust = false
    
    var card_array = ["two","three","four","five","six","seven","eight","nine","ten","king","queen","jack","ace"]
    
    @IBOutlet weak var Card1: UIImageView!
    
    @IBOutlet weak var Card2: UIImageView!
    
    @IBOutlet weak var Card3: UIImageView!
    
    @IBOutlet weak var Card4: UIImageView!
    
    @IBOutlet weak var Card5: UIImageView!
    
    @IBOutlet weak var Card6: UIImageView!
    
    
    @IBOutlet weak var P2Card1: UIImageView!
    
    @IBOutlet weak var P2Card2: UIImageView!
    
    
    @IBOutlet weak var P2Card3: UIImageView!

    @IBOutlet weak var P2Card4: UIImageView!
    
    
    @IBOutlet weak var P2Card5: UIImageView!
    
    @IBOutlet weak var P2Card6: UIImageView!
    
    
    @IBOutlet weak var Hold: UIButton!
    
    @IBOutlet weak var Hit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        p1_cards.text = player_name + "'s Score"
        p1_score.text = "\(0)"
        p2_cards.text = "CPU's Score"
        p2_score.text = "\(0)"
        //Hold.layer.cornerRadius = Hold.frame.height/2
        //Hit.layer.cornerRadius = Hit.frame.height/2
        
        Hold.layer.cornerRadius = Hold.frame.height/2
        Hit.layer.cornerRadius = Hit.frame.height/2
        
        Card1.layer.cornerRadius = 8
        Card1.layer.masksToBounds = true
        Card2.layer.cornerRadius = 8
        Card2.layer.masksToBounds = true
        Card1.image = UIImage(named: "back")
        Card2.image = UIImage(named: "back")
        Card3.layer.cornerRadius = 8
        Card3.layer.masksToBounds = true
        Card4.layer.cornerRadius = 8
        Card4.layer.masksToBounds = true
        Card3.image = UIImage(named: "back")
        Card4.image = UIImage(named: "back")
        Card5.layer.cornerRadius = 8
        Card5.layer.masksToBounds = true
        Card6.layer.cornerRadius = 8
        Card6.layer.masksToBounds = true
        Card5.image = UIImage(named: "back")
        Card6.image = UIImage(named: "back")
        
        P2Card1.layer.cornerRadius = 8
        P2Card1.layer.masksToBounds = true
        P2Card2.layer.cornerRadius = 8
        P2Card2.layer.masksToBounds = true
        P2Card1.image = UIImage(named: "back")
        P2Card2.image = UIImage(named: "back")
        P2Card3.layer.cornerRadius = 8
        P2Card3.layer.masksToBounds = true
        P2Card4.layer.cornerRadius = 8
        P2Card4.layer.masksToBounds = true
        P2Card3.image = UIImage(named: "back")
        P2Card4.image = UIImage(named: "back")
        P2Card5.layer.cornerRadius = 8
        P2Card5.layer.masksToBounds = true
        P2Card6.layer.cornerRadius = 8
        P2Card6.layer.masksToBounds = true
        P2Card5.image = UIImage(named: "back")
        P2Card6.image = UIImage(named: "back")
        
        var rar = random_generator(arr: &card_array)
        Card1.image = UIImage(named: rar)
        p1_score_count = score_return(neo: rar, current_score: p1_score_count)
        rar = random_generator(arr: &card_array)
        Card2.image = UIImage(named: rar)
        p1_score_count = score_return(neo: rar, current_score: p1_score_count)
        rar = random_generator(arr: &card_array)
        P2Card1.image = UIImage(named: rar)
        cpu_score = score_return(neo: rar, current_score: cpu_score)

        p1_score.text = "\(p1_score_count)"
        p2_score.text = "\(cpu_score)"
        // Do any additional setup after loading the view.
    }
    
    func random_generator( arr: inout [String]) -> String {
        return arr.randomElement()!
    }
    
    func score_return(neo: String, current_score: Int)-> Int{
        if(neo == "two"){
            return 2 + current_score
        }
        else if(neo == "three"){
            return 3 + current_score
        }
        else if(neo == "four"){
            return 4 + current_score
        }
        else if(neo == "five"){
            return 5 + current_score
        }
        else if(neo == "six"){
            return 6 + current_score
        }
        else if(neo == "seven"){
            return 7 + current_score
        }
        else if(neo == "eight"){
            return 8 + current_score
        }
        else if(neo == "nine"){
            return 9 + current_score
        }
        else if(neo == "ten"){
            return 10 + current_score
        }
        else if(neo == "king"){
            return 10 + current_score
        }
        else if(neo == "queen"){
            return 10 + current_score
        }
        else if(neo == "jack"){
            return 10 + current_score
        }
        else if(neo == "ace"){
            if(current_score + 10 > 21){
                return 1 + current_score
            }
            else{
                return 10 + current_score
            }
        }
        return 0
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func Hold(_ sender: Any) {
        while(cpu_score < 21){
            if(P2Card2.image == UIImage(named: "back")){
                let temp = cpu_score
                let neo = random_generator(arr: &card_array)
                cpu_score = score_return(neo: neo, current_score: cpu_score)
                if(cpu_score > 21){
                    cpu_score = temp
                    break
                }
                P2Card2.image = UIImage(named: neo)
            }
            else if(P2Card3.image == UIImage(named: "back")){
                let temp = cpu_score
                let neo = random_generator(arr: &card_array)
                cpu_score = score_return(neo: neo, current_score: cpu_score)
                if(cpu_score > 21){
                    cpu_score = temp
                    break
                }
                P2Card3.image = UIImage(named: neo)
            }
            else if(P2Card4.image == UIImage(named: "back")){
                let temp = cpu_score
                let neo = random_generator(arr: &card_array)
                cpu_score = score_return(neo: neo, current_score: cpu_score)
                if(cpu_score > 21){
                    cpu_score = temp
                    break
                }
                P2Card4.image = UIImage(named: neo)
            }
            else if(P2Card5.image == UIImage(named: "back")){
                let temp = cpu_score
                let neo = random_generator(arr: &card_array)
                cpu_score = score_return(neo: neo, current_score: cpu_score)
                if(cpu_score > 21){
                    cpu_score = temp
                    break
                }
                P2Card5.image = UIImage(named: neo)
            }
            else if(P2Card6.image == UIImage(named: "back")){
                let temp = cpu_score
                let neo = random_generator(arr: &card_array)
                cpu_score = score_return(neo: neo, current_score: cpu_score)
                if(cpu_score > 21){
                    cpu_score = temp
                    break
                }
                P2Card6.image = UIImage(named: neo)
            }
        }
        if(cpu_score > p1_score_count){
        win = false
        Total_Loss_Count += 1
            ref?.child(name_track).child("Losses").child("Loss Count").setValue(Total_Loss_Count)
        performSegue(withIdentifier: "score", sender: nil)
        }
        else{
        win = true
        Total_Win_Count += 1
    ref?.child(name_track).child("Wins").child("Win Count").setValue(Total_Win_Count)
        performSegue(withIdentifier: "score", sender: nil)
        }
    }
    
    
    
    @IBAction func Hit(_ sender: Any) {
        
        if(Card3.image == UIImage(named: "back")){
            let neo = random_generator(arr: &card_array)
            p1_score_count = score_return(neo: neo, current_score: p1_score_count)
            p1_score.text = "\(p1_score_count)"
            Card3.image = UIImage(named: neo)
            
            if(p1_score_count >  21){
                //print("you busted!")
                bust = true
                Total_Loss_Count += 1
                ref?.child(name_track).child("Losses").child("Loss Count").setValue(Total_Loss_Count)
                performSegue(withIdentifier: "score", sender: nil)
            }
            return
        }
        else if(Card4.image == UIImage(named: "back")){
            let neo = random_generator(arr: &card_array)
            p1_score_count = score_return(neo: neo, current_score: p1_score_count)
            p1_score.text = "\(p1_score_count)"
            Card4.image = UIImage(named: neo)
            if(p1_score_count >  21){
                //print("you busted!")
                bust = true
                performSegue(withIdentifier: "score", sender: nil)
            }
            return
        }
        else if(Card5.image == UIImage(named: "back")){
            let neo = random_generator(arr: &card_array)
            p1_score_count = score_return(neo: neo, current_score: p1_score_count)
            p1_score.text = "\(p1_score_count)"
            Card5.image = UIImage(named: neo)
            if(p1_score_count >  21){
                //print("you busted!")
                bust = true
                performSegue(withIdentifier: "score", sender: nil)
            }
            return
        }
        else if(Card6.image == UIImage(named: "back")){
            let neo = random_generator(arr: &card_array)
            p1_score_count = score_return(neo: neo, current_score: p1_score_count)
            p1_score.text = "\(p1_score_count)"
            Card6.image = UIImage(named: neo)
            if(p1_score_count >  21){
                //print("you busted!")
                bust = true
                performSegue(withIdentifier: "score", sender: nil)
            }
            return
        }
        return
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(bust){
            let celly = segue.destination as! WinScreenViewController
            celly.neo = "You Busted!!!"
        }
        else if(win){
            let celly = segue.destination as! WinScreenViewController
            celly.neo = "You Won by a score of \(p1_score_count) to \(cpu_score)"
        }
        else{
            let celly = segue.destination as! WinScreenViewController
            celly.neo = "You Lost by a score of \(cpu_score) to \(p1_score_count)"
        }
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
