//
//  ContentView.swift
//  TrainingToolsSwiftUI
//
//  Created by Ludovic Ollagnier on 09/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstFlow()
            SecondFlow()
        }
    }
}

struct FirstFlow: View {

    @State var lovesSwift: Bool = true

    var body: some View {
        VStack {
            if lovesSwift {
                Text("Hello")
            } else {
                Text("Goodbye")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: "Bla")
            }
            Toggle(isOn: $lovesSwift) {
                Text("Loves Swift")
                    .alert(isPresented: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Is Presented@*/.constant(false)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Alert(title: Text("Alert"))/*@END_MENU_TOKEN@*/
                }
            }
        }
            .tabItem {
                VStack{
                    Image(systemName: "1.circle")
                    Text("Hello")
                }
        }
            .tag(0)
    }
}

struct SecondFlow: View {
    var body: some View {
        VStack {
            Image(systemName: "keyboard")
            Text("User name")
            Spacer()
                .frame(height: 100)
            VStack {
                HStack {
                    Text("Label")
                    Text("Label")
                }
            }
        }
        .tabItem {
            VStack{
                Image(systemName: "2.circle")
                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                Text("World")
            }
        }
        .tag(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
