//
//  finishView.swift
//  quiz
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI

struct finishView: View {
    @State var score : Int //create variable to pass the score
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("quizApp background")
                    .resizable() //resize the img to fit its container
                    .aspectRatio(contentMode: .fill)  //stretch the img to fill the available space
                    .edgesIgnoringSafeArea(.all) //take all the edges of the screen and safe area
                
                VStack{
                    Text("You finished 🎉")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .padding()
                    
                    Text("You got \(score) out of 10!")
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    finishView(score: 0)
}
