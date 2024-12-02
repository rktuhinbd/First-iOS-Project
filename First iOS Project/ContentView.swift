//
//  ContentView.swift
//  First iOS Project
//
//  Created by Md Rejaul Karim on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card13"
    @State var cpuCard = "card12"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var showingAlert = false
    
    var body: some View {
        
        ZStack {
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack{
                    
                    Image(playerCard)
                        .padding()
                    
                    Image(cpuCard)
                        .padding()
                }
                
                Spacer()
                
                VStack {
                    Button {
                        dealCards()
                    } label: {
                        Image("button")
                    }
                }
                .alert("It's a tie!", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
    
    func dealCards(){
        //Randomize player cards
        let playerCardNumber = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardNumber)
        
        let cpuCardNumber = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardNumber)
        
        if (playerCardNumber > cpuCardNumber) {
            playerScore += 1
        } else if (cpuCardNumber > playerCardNumber) {
            cpuScore += 1
        } else {
            showingAlert.toggle()
        }
    }
}

#Preview {
    ContentView()
}
