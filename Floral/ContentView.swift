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
//                    Spacer()
//                    Text(cocktail.name)
//                    Spacer()
                    Categories()
                    Spacer()
                    Cocktails()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

struct CardView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                Image(cocktail.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 180)
                    .clipped()
                    .cornerRadius(12)
                Text(cocktail.name)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(x: -5, y: -5)
            }
            
            VStack(alignment: .leading, spacing: 5) {

                
                
                Text(cocktail.description)
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                HStack {
                    HStack {
                        Image("shaker")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text(cocktail.methodShort)
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .lineLimit(2)
                    }
                    HStack {
                        Image("glassware")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text(cocktail.glassware)
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .lineLimit(2)
                    }
                }
                HStack {
                    Image("spirit")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Cointreau, Vodka, Orange Juice")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .lineLimit(2)
                }
            }.padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(28)
        .shadow(radius: 10)
    }
}

struct CategoryCard: View {
    var category: Category
    @State private var selectedcategory = "Update"
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(category.mainImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 100)
                .clipped()
                .cornerRadius(12)
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        self.selectedcategory = self.category.name
                    }
            )
            Text(category.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .offset(x: -5, y: -5)
        }       .shadow(radius: 10)
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
