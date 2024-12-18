//
//  ContentView.swift
//  rockpaperscissors
//
//  Created by Lin Ochoa on 11/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var options = ["rock", "paper", "scissors"]
    @State private var appChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var playerScore = 0
    @State private var result = "press a button to play"
    
    @State private var numberOfRounds = 0
    
    @State private var showingEndGame = false
    @State private var endGameMessage: String = ""
    @State private var endGameTitle: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Section {
                    Text("Player Score:")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                    Text("\(playerScore)")
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                    
                }
                Section{
                    Text("App's Choice:")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                    Text("\(options[appChoice])")
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                }
                Section {
                    Text("Player Should:")
                        .font(.system(size: 20))
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                    Text("\(shouldWin ? "win" : "lose")")
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                }
            }
            .padding(20)
            .background(.black)
            .cornerRadius(20)
            
            VStack {
                Section("Player options") {
                    Spacer()
                    Button("Rock") {
                        if((shouldWin && options[appChoice] == "scissors") || (!shouldWin && options[appChoice] == "paper")) {
                            result = "you're right!"
                            playerScore += 1
                        } else{
                            result = "wrong!"
                            playerScore -= 1
                        }
                        trackGame()
                    }
                    Spacer()
                    Button("Paper") {
                        if((shouldWin && options[appChoice] == "rock") || (!shouldWin && options[appChoice] == "scissors")) {
                            result = "you're right!"
                            playerScore += 1
                        } else{
                            result = "wrong!"
                            playerScore -= 1
                        }
                        trackGame()
                    }
                    Spacer()
                    Button("Scissors") {
                        if((shouldWin && options[appChoice] == "paper") || (!shouldWin && options[appChoice] == "rock")) {
                            result = "you're right!"
                            playerScore += 1
                        } else{
                            result = "wrong!"
                            playerScore -= 1
                        }
                        trackGame()
                    }
                    Spacer()
                }
                Section {
                    Text("Result")
                        .padding(10)
                        .background(.gray)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                    Text("\(result)")
                }
            }
        }
        .alert(endGameTitle, isPresented: $showingEndGame) {
            Button("play again!", action: resetGame)
        } message: {
            Text(endGameMessage)
        }
    }
    
    func trackGame() {
        numberOfRounds += 1
        if numberOfRounds == 5 {
            showingEndGame = true
            endGameTitle = "Game Over!"
            if (playerScore >= 3) {
                endGameMessage = "You win! You scored \(playerScore) points."
            } else {
                endGameMessage = "You lose! You only scored \(playerScore) points."
            }
        }
        appChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
    }
    
    func resetGame() {
        playerScore = 0
        numberOfRounds = 0
        shouldWin = Bool.random()
        appChoice = Int.random(in: 0..<3)
    }
}

#Preview {
    ContentView()
}
