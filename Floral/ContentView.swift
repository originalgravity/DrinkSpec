//
//  ContentView.swift
//  Floral
//
//  Created by James Evans on 25/04/2020.
//  Copyright © 2020 James Evans. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let cocktail = Bundle.main.decode([Cocktail].self, from: "cocktails.json")
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                    VStack {
                        TitleSpace()
                        Spacer()
                        Text("Selected")
                        Spacer()
                        NavigationView {
                            Categories()
                        }
                        Spacer()
                        Cocktails()
                }
            }
        }
    }
}

struct TitleSpace: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("QuicSpec")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Specs on the go")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            } .padding([.horizontal, .bottom])
            Spacer()
            Image("mojo")    .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:75, height: 80)
            .padding()

        }
    }
}

struct Cocktails: View {
    let cocktail = Bundle.main.decode([Cocktail].self, from: "cocktails.json")
    var body: some View {
        VStack {
            ForEach(cocktail, id: \.self) { cocktail in
                CardView(cocktail: cocktail)
            }
        }
    }
}

struct Categories: View {
    let category = Bundle.main.decode([Category].self, from: "categories.json")
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(category, id: \.self) { category in
                    CategoryCard(category: category)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
