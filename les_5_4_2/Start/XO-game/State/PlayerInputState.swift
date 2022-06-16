//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Роман Чикишев on 16.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//


// MARK: - Добрый день, извините, я повторил урок, но домашку не сделал, я улетаю в отпуск и просто не успеваю по времени
import Foundation

class PlayerInputState: GameState {
    
    private(set) var isCompleted = false
    
    let player: Player
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameBoard: Gameboard?
    private(set) weak var gameBoardView: GameboardView?
    
    init(player: Player,
         gameViewController: GameViewController,
         gameBoard: Gameboard,
         gameBoardView: GameboardView){
        self.player = player
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        
    }
    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        gameViewController?.winnerLabel.isHidden = true
    }
    
    
    func addMark(at position: GameboardPosition) {
        guard let gameBoardView = self.gameBoardView,
                gameBoardView.canPlaceMarkView(at: position) else {
            return
        }
        
        let markView: MarkView
        switch player {
        case .first:
            markView = XView()
        case .second:
            markView = OView()
        }
        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markView, at: position)
        
        isCompleted = true
    }
    
    
}
