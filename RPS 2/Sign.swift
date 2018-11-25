//
//  Sign.swift
//  RPS 2
//
//  Created by Antonio Porras on 11/25/18.
//  Copyright © 2018 Antonio Porras. All rights reserved.
//

import Foundation
import GameKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissor
    }
}

enum Sign {
    case rock
    case paper
    case scissor
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissor:
            return "✌️"
        }
    }
    
    func compareSigns(computer: Sign) -> GameState {
        switch self {
        // ROCK VS ...
        case .rock:
            switch computer {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.lose
            case .scissor:
                return GameState.win
            }
        // PAPER VS ...
        case .paper:
            switch computer {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissor:
                return GameState.lose
            }
        // SCISSORS VS ...
        case .scissor:
            switch computer {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissor:
                return GameState.draw
            }
        }
    }
    
}


