//
//  AboutView.swift
//  bulls-eye
//
//  Created by Mun Jonghae on 2020/01/06.
//  Copyright © 2020 Mun Jonghae. All rights reserved.
//

import SwiftUI

let lightShadeOfOrange = Color(red: 255.0/255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0 )


struct HeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .padding([.bottom, .top], 20)
            //.padding(.top, 20)
            
    }
}

struct TextViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .padding(.leading, 60)
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            //.padding(.top, 20)
            
    }
}








struct AboutView: View {
    var body: some View {
        Group {
            VStack{
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                Text("🍖This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(TextViewStyle()).lineLimit(nil)
                Text("🍖 Your goal is to place the slider as close as possible to the target value.The closer you are, the more points you score.").modifier(TextViewStyle())
                Text("🍖🍺🍻 Enjoy! 🍻🍺🍖").modifier(TextViewStyle())
            }
            .background(lightShadeOfOrange)
            .navigationBarTitle("About Bullseye.")
        }
    .background(Image("Background"))
    }
}

//.accentColor(lightShadeOfOrange)



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width:896, height:414))
    }
}


