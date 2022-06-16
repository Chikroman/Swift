//
//  GameFinishState.swift
//  XO-game
//
//  Created by Роман Чикишев on 16.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

class GameFinishState: GameState {
    
    let isCompleted = false
    let winner: Player?
    private(set) weak var gameViewController: GameViewController?
    
    init(winner: Player?, gameViewController: GameViewController) {
        self.winner = winner
        self.gameViewController = gameViewController
    }
    
    func begin() {
        gameViewController?.winnerLabel.isHidden = false
        
        if let winner = winner {
            gameViewController?.winnerLabel.text = winnerName(from: winner)
        } else {
            gameViewController?.winnerLabel.text = "No winner"
        }
        gameViewController?.firstPlayerTurnLabel.isHidden = true
        gameViewController?.secondPlayerTurnLabel.isHidden = true

    }
    
    func addMark(at position: GameboardPosition) {
        
    }
    
    private func winnerName(from winner: Player) -> String {
        switch winner {
        case .first:
            return "1st player winenr"
        case .second:
            return "2 st player winenr"
        }
    }
    
}
