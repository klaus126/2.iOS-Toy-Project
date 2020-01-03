//
//  ContentView.swift
//  Bullseye
//
//  Created by Mun Jonghae on 2020/01/02.
//  Copyright © 2020 Mun Jonghae. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    
    var body: some View {
        VStack {
            Text("Welcom to my first app!")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("This is my firt pop-up"), dismissButton: .default(Text("Awesome!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
