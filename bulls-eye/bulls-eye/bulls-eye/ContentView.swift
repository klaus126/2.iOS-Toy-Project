//
//  ContentView.swift
//  bulls-eye
//
//  Created by Mun Jonghae on 2020/01/04.
//  Copyright © 2020 Mun Jonghae. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    @State var whosThereIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                Text("\(target)")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("0")
                Slider(value: $sliderValue, in: 0...100)
                Text("100")
            }
            Spacer()
            
            Button(action: {
                print("Button pressed!")
                self.whosThereIsVisible = true

            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $whosThereIsVisible) {() -> Alert in
                //let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text(alertTitle()),
                             message: Text("The slider value is \(sliderValueRounded()).\n" +
                                        "You scored \(pointsForCurrentRound()) points this round."),
                             dismissButton: .default(Text("Awesome")) {
                                self.score = self.score + self.pointsForCurrentRound()
                                self.target = Int.random(in: 1...100)
                                self.round += 1
                    }
            )}
            
           

            
            Spacer()
            // Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                        .multilineTextAlignment(.leading)
                }
                /*.alert(item: $alertIsVisible, content: <#T##(Identifiable) -> Alert#>)
                */
                Spacer()
                Text("Score: ")
                Text("\(score)")
                
                Spacer()
                Text("Round: ")
                Text("\(round)")
                
                Spacer()
                Button(action: {}) {
                    Text("info")
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.bottom, 20) //.padding(from where, distance)
        }
    }
    
    
    /*
    1. Global scope
    2. Instance scope : content view | inside struct
    3. Local scope : roundedValue / currentValue | inside func
    */
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded()) // 한줄인 경우는 return이라고 굳이 안해줘도 된다. type inference
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maxScore - difference + bonus
        
        /*
        if roundedValue > self.target {
            difference = roundedValue - self.target
        } else if self.target > roundedValue {
            difference = self.target - roundedValue
        } else {
            difference = 0
        }
        */
        
        
        /* if something is true {
            then do this
        } else if something else is true {
         } else {
         }
        */

        
    /*func pointsForCurrentRound() -> Int {
        var sliderValue = roundedValue
        var positiveSliderValue: Int
        if sliderValue < -1 {
            positiveSliderValue = sliderValue * (-1)
        }
        return positiveSliderValue
    }*/
    
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width:896, height:414))
    }
}





/*
 
 }
 */



