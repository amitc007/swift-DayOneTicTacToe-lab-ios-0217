//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jim Campagno on 2/5/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BoardDelegate {
    
    @IBOutlet weak var boardZero: Board!
    @IBOutlet weak var boardOne: Board!
    @IBOutlet weak var boardTwo: Board!
    
    @IBOutlet weak var boardThree: Board!
    @IBOutlet weak var boardFour: Board!
    @IBOutlet weak var boardFive: Board!
    
    @IBOutlet weak var boardSix: Board!
    @IBOutlet weak var boardSeven: Board!
    @IBOutlet weak var boardEight: Board!
    
    @IBOutlet weak var nextMoveMsg: UILabel!
    
    @IBOutlet weak var mainBoardWinner: UILabel!
    
    var allBoards: [Board] {
        return [boardZero, boardOne, boardTwo, boardThree, boardFour, boardFive, boardSix, boardSeven, boardEight]
    }
    
    var boardArr = Array(repeating: Array(repeating: -1, count:9), count:9)
    var mainBoardArr = Array(repeating: -1, count:9)
    var sign:Bool = false
    var nextActiveBoard = -1
    var playedBoard = -1
    var playedPosition = -1
    
    
    override func viewDidLoad() {
        print("Entering viewDidLoad")
        super.viewDidLoad()
        initialSetup()
        /*if playedBoard != -1 && playedPosition != -1 {
            checkWinner(subBoardNo: playedBoard, pos: playedPosition )
        } */
    }
    
    
    func initialSetup() {
        var boardPosition = 0
        for board in allBoards {
            board.position = boardPosition
            board.delegate = self
            boardPosition += 1
        }
    }
    
    func playerTurn(board: Board, position: Int) -> Player {
        var player:Player? = nil
        print("Board Position:\(board.position)")
        print("Position:\(position)")
        /*if UIImagePNGRepresentation(board.zeroImageView.image!).eq (UIImagePNGRepresentation(#imageLiteral(resourceName: "OImage")))    /*board.zeroImageView.image == #imageLiteral(resourceName: "OImage") */ {
            print("zeroImageView is O")
        } else {
            print("zeroImageView is X")
        }*/
        
        if sign {
            sign = false
            boardArr[board.position][position] = 0   //if sign true it is O
            checkWinner(subBoardNo: board.position, pos:position)
            player = .o
        //return .o
        }
        else {
            sign = true
            boardArr[board.position][position] = 1
            playedBoard = board.position
            playedPosition = position
            checkWinner(subBoardNo: board.position, pos:position)
            player = .x
            //return .x
        }
        //if position board is winner , mark it or assign activeBoard for next move
        if mainBoardArr[position] != -1 {
            nextActiveBoard = -1
        }
        else {
            nextActiveBoard = position
        }
        return player!
    }
    
    func checkWinner(subBoardNo:Int, pos:Int) {
        //for (idx,subBoard) in allBoards.enumerated() {
            /*if  board.zeroImageView.image == #imageLiteral(resourceName: "OImage") && board.oneImageView.image == #imageLiteral(resourceName: "OImage") && board.twoImageView.image == #imageLiteral(resourceName: "OImage") {
                board.win(for: Player.o) } */

                if
                    //horiz
                    (boardArr[subBoardNo][0] != -1 && boardArr[subBoardNo][0] == boardArr[subBoardNo][1] && boardArr[subBoardNo][1] == boardArr[subBoardNo][2]) || (boardArr[subBoardNo][3] != -1 && boardArr[subBoardNo][3] == boardArr[subBoardNo][4] && boardArr[subBoardNo][4] == boardArr[subBoardNo][5])  || (boardArr[subBoardNo][6] != -1 && boardArr[subBoardNo][6] == boardArr[subBoardNo][7] && boardArr[subBoardNo][7] == boardArr[subBoardNo][8]) ||
                    //vertical
                    (boardArr[subBoardNo][0] != -1 && boardArr[subBoardNo][0] == boardArr[subBoardNo][3] && boardArr[subBoardNo][3] == boardArr[subBoardNo][6]) || (boardArr[subBoardNo][1] != -1 && boardArr[subBoardNo][1] == boardArr[subBoardNo][4] && boardArr[subBoardNo][4] == boardArr[subBoardNo][7]) || (boardArr[subBoardNo][2] != -1 &&  boardArr[subBoardNo][2] == boardArr[subBoardNo][5] && boardArr[subBoardNo][5] == boardArr[subBoardNo][8]) ||
                    //diagnol
                    (boardArr[subBoardNo][0] != -1 && boardArr[subBoardNo][0] == boardArr[subBoardNo][4] && boardArr[subBoardNo][4] == boardArr[subBoardNo][8]) ||
                    (boardArr[subBoardNo][2] != -1 && boardArr[subBoardNo][2] == boardArr[subBoardNo][4] && boardArr[subBoardNo][4] == boardArr[subBoardNo][6])
                    {
                        //match found
                        if boardArr[subBoardNo][pos] == 0 {
                            allBoards[subBoardNo].win(for: Player.o )
                            //mark board as won
                            allBoards[subBoardNo].winner = Player.o
                            mainBoardArr[subBoardNo] = 0
                           
                        }
                        else if boardArr[subBoardNo][pos] == 1 {
                            allBoards[subBoardNo].win(for: Player.x )
                            //mark board as won
                            allBoards[subBoardNo].winner = Player.x
                            mainBoardArr[subBoardNo] = 1
                      }
                     //activeBoard = -1   //winner can choose any board
                    //sign = false  //let user initiate game
                    //if computer won last game
                    /*if sign {
                        
                    } */
                    } //if
        
        //check main board for winner
        if
            //horiz
            (mainBoardArr[0] != -1 && mainBoardArr[0] == mainBoardArr[1] && mainBoardArr[1] == mainBoardArr[2]) || (mainBoardArr[3] != -1 && mainBoardArr[3] == mainBoardArr[4] && mainBoardArr[4] == mainBoardArr[5])  || (mainBoardArr[6] != -1 && mainBoardArr[6] == mainBoardArr[7] && mainBoardArr[7] == mainBoardArr[8]) ||
                //vertical
                (mainBoardArr[0] != -1 && mainBoardArr[0] == mainBoardArr[3] && mainBoardArr[3] == mainBoardArr[6]) || (mainBoardArr[1] != -1 && mainBoardArr[1] == mainBoardArr[4] && mainBoardArr[4] == mainBoardArr[7]) || (mainBoardArr[2] != -1 &&  mainBoardArr[2] == mainBoardArr[5] && mainBoardArr[5] == mainBoardArr[8]) ||
                //diagnol
                (mainBoardArr[0] != -1 && mainBoardArr[0] == mainBoardArr[4] && mainBoardArr[4] == mainBoardArr[8]) ||
                (mainBoardArr[2] != -1 && mainBoardArr[2] == mainBoardArr[4] && mainBoardArr[4] == mainBoardArr[6])
        {
            if mainBoardArr[subBoardNo] == 0 {
                print("Winner is O")
                mainBoardWinner.text = "Game Over. Winner is O"
            }
            else {
                print("Winner is X")
               mainBoardWinner.text = "GameOver. Winner is X"
             }

        }
    }//func checkWinner
    
    func computerPlay(activeBoardNo:Int) {
        var newActiveBoardNo = activeBoardNo
        print("Entering computerPlay")
        //if board is already winner, choose another
        while (mainBoardArr[newActiveBoardNo] != -1) {
            newActiveBoardNo = Int(arc4random_uniform(9))
        }
        
        var computerPos = Int(arc4random_uniform(9))
        if activeBoardNo == -1 {    //choose any board
            
        }
        else
        {
            //choose another position, if already taken
            while (boardArr[newActiveBoardNo][computerPos] != -1) {
                computerPos = Int(arc4random_uniform(9))
            }
            print("ComputerPlay :Board:\(newActiveBoardNo) Pos:\(computerPos)")
            let player = playerTurn(board: allBoards[newActiveBoardNo] , position: computerPos)
            let imageView = allBoards[newActiveBoardNo].all[computerPos]
            allBoards[newActiveBoardNo].animateTurn(imageView: imageView, player: player)
            
            nextMoveMsg.text = "Play on Board:\(nextActiveBoard)"
        } //else
    }
    
}
