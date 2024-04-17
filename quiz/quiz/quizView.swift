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
    
    //create variables
    @State var index : Int = 0
    @State var score: Int = 0
    @State var numQuestion : Int = 1
    @State var numAnswerChosen : Int = 0
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
                        .padding(.top, 50)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: 350, alignment: .leading)

                    Text("Question \(numQuestion)\n\(questions[index].question)")
                        .frame(width: 350, height: 150)
                        .background(.white)
                        .border(.black, width: 2)
                        .cornerRadius(8)

                    
                    ForEach(shuffledOptions.indices, id: \.self) { i in
                        let option = shuffledOptions[i] //assign option to options in the array
                        Button(action: {
                            manageAnswer(selectedOption: option)
                            shuffle = false //stop shuffling after an option is clicked
                            showNextBtn = true //show the next button
                        }){
                            Text(option)
                                .foregroundColor(.black)
                                .frame(width: 300, height: 50)
                                .border(Color.black, width: 2)
                        }
                        .background(numAnswerChosen == 1 ? (option == questions[index].answer ? .green : .red) : .white) //use a nested tenary operated to check if user click an answer, then check if the answer is right or wrong
                        .disabled(numAnswerChosen == 1) //disable the button when an option is clicked
                    }
                    .padding()
                    Spacer()
                    
                    if showNextBtn{
                        Button(action: {
                            if numQuestion < questions.count && numAnswerChosen == 1{ //check if the question is less than 10 and the user chooses an option
                                showNextBtn = false
                                index += 1 //change to the next question
                                numQuestion += 1 //keep track the number of question
                                numAnswerChosen = 0 //reset the variable
                                shuffledOptions = questions[index].options.shuffled() //reset
                            }
                            else{ //check if the question is 10
                                showNextBtn = false
                            }

                        }){
                            Text("Next")
                                .padding(15)
                                .padding(.bottom, 0)
                                .font(.system(size: 20))
                                .background(.white)
                                .foregroundColor(.blue)
                                .frame(width: 100, height: 60)
                        }
                    }
                    
                    if numQuestion == 10 && numAnswerChosen == 1 && !showNextBtn{ //check if question is 10 and user chooses an option and showNextBtn is false
                        HStack {
                            NavigationLink(destination: ContentView(), label: { //navigate to quizView when Play is clicked
                                Text("Play Again")
                                    .frame(maxWidth: 130, maxHeight: 60)
                                    .background(.white)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 25))
                                    .cornerRadius(8)
                            })
                            
                            NavigationLink(destination: finishView(score: score), label: { //navigate to quizView when Play is clicked
                                Text("Finish")
                                    .frame(maxWidth: 130, maxHeight: 60)
                                    .background(.white)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 25))
                                    .cornerRadius(8)
                            })
                            
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        .onAppear{ //shuffle when a view appears
            if shuffle{ //when shuffle true, shuffle the options
                shuffledOptions = questions[index].options.shuffled() //assign shuffledOptions to options in the array but shuffled
            }
            shuffle = true //reset
        }
    }
    func manageAnswer(selectedOption : String){
        if selectedOption == questions[index].answer{ //check if the answer chosen is correct
            numAnswerChosen = 1 //keep track if user choose an option
            score += 1 //update score if correct
        }
        else{
            numAnswerChosen = 1
        }
    }
}

#Preview {
    quizView()
}
