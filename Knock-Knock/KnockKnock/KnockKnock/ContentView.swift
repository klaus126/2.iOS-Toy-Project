//
//  ContentView.swift
//  KnockKnock
//
//  Created by Mun Jonghae on 2020/01/02.
//  Copyright © 2020 Mun Jonghae. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var whosThereIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Knock, Knock!")
            Button(action: {
                self.whosThereIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $whosThereIsVisible) {
                () -> Alert in return
                Alert(title: Text("Whos there?"),
                    message: Text("You`d better to answer it"),
                    dismissButton: .default(Text("Okay!"))
                )
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
