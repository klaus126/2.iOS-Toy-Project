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
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0 )
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .modifier(Shadow())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(Shadow())

        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())

                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("0").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 0...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            Button(action: {
                print("Button pressed!")
                self.whosThereIsVisible = true

            }) {
                Text("Hit Me!").modifier(ButtonLargeTextStyle())
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
                .background(Image("Button")).modifier(Shadow())
            
           

            
            Spacer()
            // Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    HStack{
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallTextStyle())
                        //.multilineTextAlignment(.leading)
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                /*.alert(item: $alertIsVisible, content: <#T##(Identifiable) -> Alert#>)
                */
                Spacer()
                Text("Score: ").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                
                Spacer()
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack{
                        Image("InfoIcon")
                        Text("info").modifier(ButtonSmallTextStyle())
                        //.multilineTextAlignment(.trailing)
                    }
                }
                .background(Image("Button")).modifier(Shadow())
            }
            .padding(.bottom, 20) //.padding(from where, distance)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
    .navigationBarTitle("Bullseye")
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
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 0...100)
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



