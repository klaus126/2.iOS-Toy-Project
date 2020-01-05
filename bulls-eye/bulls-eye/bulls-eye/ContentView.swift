//
//  ContentView.swift
//  bulls-eye
//
//  Created by Mun Jonghae on 2020/01/04.
//  Copyright © 2020 Mun Jonghae. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    @State var whosThereIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                Text("\(self.target)")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("0")
                Slider(value: self.$sliderValue, in: 0...100)
                Text("100")
            }
            Spacer()
            
            Button(action: {
                self.whosThereIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $whosThereIsVisible) {() -> Alert in
                let roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello there"),
                             message: Text("The slider value is \(roundedValue).\n" +
                                        "You scored \(self.pointsForCurrentRound()) points this round."),
                      dismissButton: .default(Text("Awesome"))
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
                Text("999999")
                
                Spacer()
                Text("Round: ")
                Text("999")
                
                Spacer()
                Button(action: {}) {
                    Text("info")
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.bottom, 20) //.padding(from where, distance)
        }
    }
    func pointsForCurrentRound() -> Int {
        
        let roundedValue: Int = Int(self.sliderValue.rounded())
        let difference: Int = abs(self.target - roundedValue)
        let awardedPoints: Int = 100 - difference
        return awardedPoints
        
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width:896, height:414))
    }
}





/*
 
 }
 */
