//
//  ContentView.swift
//  quiz
//
//  Created by StudentAM on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("quizApp background")
                    .resizable() //resize the img to fit its container
                    .aspectRatio(contentMode: .fill)  //stretch the img to fill the available space
                    .edgesIgnoringSafeArea(.all) //take all the edges of the screen and safe area
                
                VStack(spacing: 150){ //add spacing between two texts
                    Text("Trivia Quiz")
                        .foregroundStyle(.white)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                    
                    NavigationLink(destination: quizView(), label: { //navigate to quizView when Play is clicked
                        Text("Play")
                            .frame(maxWidth: 200, maxHeight: 60)
                            .background(.white)
                            .foregroundColor(.blue)
                            .font(.system(size: 30))
                            .cornerRadius(8)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
