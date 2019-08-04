//
//  ViewController.swift
//  lastshit
//
//  Created by James Boisvert on 7/24/19.
//  Copyright © 2019 James Boisvert. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

var Total_Win_Count = 0
var Total_Loss_Count = 0
var War_Total_Win_Count = 0
var War_Total_Loss_Count = 0
var name_track = ""
var war_wins = false
var war_losses = false
var war_win_percentage = false
var blackjack_wins = false
var blackjack_losses = false
var blackjack_win_percentage = false


class ViewController: UIViewController {
    var ref:DatabaseReference?
    
    
    @IBOutlet weak var War_Wins: UILabel!
    
    @IBOutlet weak var War_Losses: UILabel!
    
    @IBOutlet weak var War_Win_Percentage: UILabel!
    
    @IBOutlet weak var War_wins: UIView!
    
    @IBOutlet weak var War_losses: UIView!
    
    @IBOutlet weak var War_win_percentage: UIView!
    
    @IBOutlet weak var Name_field: UITextField!
    
    
    @IBOutlet weak var play_blackjack: UIButton!
    
    
    @IBOutlet weak var Get_stats: UIButton!
    
    
    @IBOutlet weak var play_war: UIButton!
    
    @IBOutlet weak var Blackjack_Wins: UIView!
    
    @IBOutlet weak var Blackjack_wins: UILabel!
    
    @IBOutlet weak var Blackjack_Losses: UIView!
    
    @IBOutlet weak var Blackjack_losses: UILabel!
    
    
    @IBOutlet weak var Blackjack_Win_Percentage: UIView!
    
    
    @IBOutlet weak var Blackjack_win_percentage: UILabel!
    
    
    @IBOutlet weak var black_jack_wins_booton: UIButton!
    
    
    @IBOutlet weak var Get_Stats: UIButton!
    
    var blackjack = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Blackjack_wins.text = ref?.child("Wins").o//"\(Total_Win_Count)"
        //Blackjack_losses.text = "\(Total_Loss_Count)"
        
        
        ref = Database.database().reference()
        
        Get_stats.layer.cornerRadius = 8
        Get_stats.layer.masksToBounds = true
        play_blackjack.layer.cornerRadius = 8
        play_war.layer.cornerRadius = 8
        play_blackjack.layer.masksToBounds = true
        play_war.layer.masksToBounds = true
        Blackjack_Wins.layer.cornerRadius = 8
        Blackjack_Wins.layer.masksToBounds = true
        Blackjack_Losses.layer.cornerRadius = 8
        Blackjack_Losses.layer.masksToBounds = true
        Blackjack_Win_Percentage.layer.cornerRadius = 8
    Blackjack_Win_Percentage.layer.masksToBounds = true
        War_wins.layer.cornerRadius = 8
        War_wins.layer.masksToBounds = true
        War_losses.layer.cornerRadius = 8
        War_losses.layer.masksToBounds = true
        War_win_percentage.layer.cornerRadius = 8
        War_win_percentage.layer.masksToBounds = true
    }
    
    
    @IBAction func play_war(_ sender: Any) {
        if Name_field.text != ""{
            name_track = Name_field.text!
            
            
            ref?.child(name_track).child("Wins").child("Win Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    Total_Win_Count = neo
                }
            })
            
            ref?.child(name_track).child("Losses").child("Loss Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    Total_Loss_Count = neo
                }
            })

            ref?.child(name_track).child("Wins").child("War Win Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    War_Total_Win_Count = neo
                }
            })
            
            ref?.child(name_track).child("Losses").child("War Loss Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    War_Total_Loss_Count = neo
                }
            })
            
            performSegue(withIdentifier: "warsegue", sender: nil)
        }
    }
    
    
    @IBAction func Get_stats(_ sender: Any) {
        if Name_field.text != ""{
            name_track = Name_field.text!
            

        ref?.child(name_track).child("Wins").child("Win Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    Total_Win_Count = neo
                }
            })
            
            ref?.child(name_track).child("Losses").child("Loss Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    Total_Loss_Count = neo
                }
            })
            
            ref?.child(name_track).child("Wins").child("War Win Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    War_Total_Win_Count = neo
                }
            })
            
            ref?.child(name_track).child("Losses").child("War Loss Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    War_Total_Loss_Count = neo
                }
            })
            
            let foo: Double = Double(Total_Win_Count) / Double(Total_Win_Count + Total_Loss_Count) * 100
            let foo1: Double = Double(War_Total_Win_Count) / Double(War_Total_Win_Count + War_Total_Loss_Count) * 100
            if(Total_Win_Count > 0 || Total_Loss_Count > 0){
                self.Blackjack_wins.text = "\(Total_Win_Count)"
                self.Blackjack_losses.text = "\(Total_Loss_Count)"
                self.Blackjack_win_percentage.text = "\(round(foo))%"
            }
            if(War_Total_Win_Count > 0 || War_Total_Loss_Count > 0){
                self.War_Wins.text = "\(War_Total_Win_Count)"
                self.War_Losses.text = "\(War_Total_Loss_Count)"
                self.War_Win_Percentage.text = "\(round(foo1))"
            }
            
            //performSegue(withIdentifier: "warsegue", sender: nil)
        }
        
    }
    
    
    @IBAction func play_blackjack(_ sender: Any) {
        if Name_field.text! != ""{
            blackjack = true
            name_track = Name_field.text!
           
            
            ref?.child(name_track).child("Wins").child("War Win Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    War_Total_Win_Count = neo
                }
            })
            
            ref?.child(name_track).child("Losses").child("War Loss Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    War_Total_Loss_Count = neo
                }
            })
            ref?.child(name_track).child("Wins").child("Win Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    Total_Win_Count = neo
                }
                })
            
            ref?.child(name_track).child("Losses").child("Loss Count").observe(.value, with: {(snapshot) in
                
                let ran = snapshot.value as? Int
                if let neo = ran{
                    Total_Loss_Count = neo
                }
            })
            performSegue(withIdentifier: "blackjack", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(blackjack){
            let segs = segue.destination as! BlackJackViewController
            segs.player_name = Name_field.text!
        }
        else{
            let segs = segue.destination as! WarViewController
            segs.p_card = Name_field.text! + "'s Card"
          //  segs.p_card = "CPU's Card"
        }
    }
    
    @IBAction func unwindToOrig(unwindSegue: UIStoryboardSegue){
        blackjack = false
        // var result: Double = Double(sum) / Double(countOfNumbers)
        if(Total_Win_Count == 0){
            let foo: Double = 0.0
            self.Blackjack_wins.text = "\(Total_Win_Count)"
            self.Blackjack_losses.text = "\(Total_Loss_Count)"
            self.Blackjack_win_percentage.text = "\(round(foo))%"
            self.War_Wins.text = "\(War_Total_Win_Count)"
            self.War_Losses.text = "\(War_Total_Loss_Count)"
            self.War_Win_Percentage.text = "\(round(foo))"
        }
        else{
        let foo: Double = Double(Total_Win_Count) / Double(Total_Win_Count + Total_Loss_Count) * 100
        let foo1: Double = Double(War_Total_Win_Count) / Double(War_Total_Win_Count + War_Total_Loss_Count) * 100
        print(foo)
        self.Blackjack_wins.text = "\(Total_Win_Count)"
        self.Blackjack_losses.text = "\(Total_Loss_Count)"
        self.Blackjack_win_percentage.text = "\(round(foo))%"
        self.War_Wins.text = "\(War_Total_Win_Count)"
        self.War_Losses.text = "\(War_Total_Loss_Count)"
        self.War_Win_Percentage.text = "\(round(foo1))"
        }
        //self.Blackjack_wins.text = "\(Total_Win_Count)"
        //self.Blackjack_losses.text = "\(Total_Loss_Count)"
        //self.Blackjack_win_percentage.text = "\(foo)%"
        
    }
    
    
    @IBAction func blackjack_wins_button(_ sender: Any) {
        print("fuck")
    }
    
    
    
}

