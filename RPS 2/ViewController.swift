//
//  ViewController.swift
//  RPS 2
//
//  Created by Antonio Porras on 11/25/18.
//  Copyright © 2018 Antonio Porras. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    let winColor: UIColor = .green
    let loseColor: UIColor = .red
    let drawColor: UIColor = .yellow
    let startGame: UIColor = .white
    
    
    @IBOutlet weak var appSign: UILabel!
    
    @IBOutlet weak var statusOfTheGame: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var scissorButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }
    
    @IBAction func rockPressedButton(_ sender: UIButton) {
        playing(player: .rock)
    }
    
    
    @IBAction func paperPressedButton(_ sender: UIButton) {
        playing(player: .paper)
    }
    
    
    @IBAction func scissorPressedButton(_ sender: UIButton) {
        playing(player: .scissor)
    }
    
    
    @IBAction func playAgainPressedButton(_ sender: UIButton) {
        updateUI()
    }
    
    func updateUI() {
    
            appSign.text = "🤖"
            playAgainButton.isHidden = true
            
            rockButton.isEnabled = true
            rockButton.isHidden = false
            paperButton.isEnabled = true
            paperButton.isHidden = false
            scissorButton.isEnabled = true
            scissorButton.isHidden = false
        
    }
    
    func playing(player: Sign) {
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorButton.isEnabled = true
        
        let computer = randomSign()
        appSign.text = computer.emoji
        let result = player.compareSigns(computer: computer)
        
        switch result {
        case .draw:
            statusOfTheGame.text = "Draw"
            view.backgroundColor = drawColor
        case .lose:
            statusOfTheGame.text = "Lose"
            view.backgroundColor = loseColor
        case .win:
            statusOfTheGame.text = "Win"
            view.backgroundColor = winColor
        case .start:
            statusOfTheGame.text = "Rock, Paper, Scissors?"
            view.backgroundColor = startGame
        }
        
        switch player {
            case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorButton.isHidden = true
            case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorButton.isHidden = true
        case .scissor:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
    
    
}

