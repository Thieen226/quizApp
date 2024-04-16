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
        Question(question: "Who painted the famous artwork The Last Supper?", options: ["Pablo Picasso", "Leonardo da Vinci", "Michelangelo", "Vincent van Gogh"], answer: "Leonardo da Vinci"),
        Question(question: "What company was initially known as Blue Ribbon Sports?", options: ["Puma", "Nike", "Adidas", "Under Armour"], answer: "Nike"),
        Question(question: "How many bones do we have in an ear?", options: ["2", "4", "3", "5"], answer: "3"),
    ]
    @State var index : Int = 0
    @State var score: Int = 0
    @State var numQuestion : Int = 1
    @State var numAnswerChosen : Int = 0
    @State var correctAnswer : Bool = false
    @State var shuffledOptions : [String] = []
    @State var shuffle : Bool = true
    @State var showNextBtn : Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("quizApp background")
                    .resizable() //resize the img
                    .aspectRatio(contentMode: .fill) //stretch the img
                    .edgesIgnoringSafeArea(.all) //let the img take all the edge spaces
                
                
                VStack{
                    Text("Score: \(score)")
                    
                    Text("Question \(numQuestion)")
                    
                    Text(questions[index].question)
                    
                    ForEach(shuffledOptions.indices, id: \.self) { option in
                        let option = shuffledOptions[option] //assign option to options in the array
                        Button(action: {
                            manageAnswer(selectedOption: option)
                            shuffle = false //stop shuffling after an option is clicked
                            showNextBtn = true
                        }){
                            Text(option)
                                .padding()
                                .background(.white)
                                .foregroundColor(.black)
                        }
                        .background(option == questions[index].answer ? .green : .red)
                        .disabled(numAnswerChosen == 1) //disable the button when an option is clicked
                    }
                    Spacer()
                    
                    if showNextBtn{
                        Button(action: {
                            index += 1
                            numQuestion += 1
                            numAnswerChosen = 0
                            shuffledOptions = questions[index].options.shuffled()
                        }){
                            Text("Next")
                                .background(.black)
                        }
                    }
                }
            }

        }
        .onAppear{ //shuffle when a view appears
            if shuffle{ //when shuffle true, shuffle the options
                shuffledOptions = questions[index].options.shuffled() //assign shuffledOptions to options in the array but shuffled
            }
            shuffle = true //reset
        }
    }
    func manageAnswer(selectedOption : String){
        if selectedOption == questions[index].answer{ //check if the answer chosen is correct
            correctAnswer = true
            numAnswerChosen += 1
            score += 1
        }
        else{
            numAnswerChosen += 1
            correctAnswer = false
        }
    }
}

#Preview {
    quizView()
}
