//
//  quizView.swift
//  quiz
//
//  Created by StudentAM on 4/12/24.
//

import SwiftUI

struct Question{ //create a struct for questions
    var question: String
    var options: [String]
    var answer: String
}

struct quizView: View {
    @State private var questions = [ //array of questions, options, and answers
        Question(question: "How many McDonald's are there in the U.S.?", options: ["13,528", "1,224", "41,822", "19,878"], answer: "13,528"),
        Question(question: "Which country invented ice cream?", options: ["China", "Greek", "England", "Italy"], answer: "China"),
        Question(question: "What's the smallest country in the world?", options: ["Monaco", "Vatican City", "Sri Lanka", "Iceland"], answer: "Vatican City"),
        Question(question: "Which country invented croissant?", options: ["England", "Italy", "Austria", "Turkey"], answer: "Austria"),
        Question(question: "How many countries in the U.K.?", options: ["1", "2", "3", "4"], answer: "4"),
        Question(question: "Which country is known as the Land of Rising Sun?", options: ["Japan", "France", "China", "Korea"], answer: "Japan"),
        Question(question: "What is the largest continent in the world?", options: ["Europe", "Asia", "Africa", "North America"], answer: "Asia"),
        Question(question: "Who painted the famous artwork The Last Supper?", options: ["Pablo Picasso", "Leonado da Vinci", "Michelangelo", "Vincent van Gogh"], answer: "Leonardo da Vinci"),
        Question(question: "What company was initially known as Blue Ribbon Sports?", options: ["Puma", "Nike", "Adidas", "Under Armour"], answer: "Nike"),
        Question(question: "How many bones do we have in an ear?", options: ["2", "4", "3", "5"], answer: "3"),
    ]
    @State var index : Int = 0
    @State var score: Int = 0
    @State var numQuestion : Int = 1
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("quizApp background")
                    .resizable() //resize the img
                    .aspectRatio(contentMode: .fill) //stretch the img
                    .edgesIgnoringSafeArea(.all) //let the img take all the edge spaces
                
                
                VStack{
                    Text("Question \(numQuestion)")
                    
                    Text(questions[index].question)
                    
                    ForEach(questions[index].options.shuffled(), id: \.self) { option in
                        Button(action: {
                            let selectedOption = option
                            manageAnswer(selectedOption: option)
                        }){
                            Text(option)
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    func manageAnswer(selectedOption : String){
        if selectedOption == questions[index].answer{
            print("HI")
        }
        else{
            print("False")
        }
    }
}

#Preview {
    quizView()
}
