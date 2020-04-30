//
//  CocktailDetailView.swift
//  Floral
//
//  Created by James Evans on 25/04/2020.
//  Copyright © 2020 James Evans. All rights reserved.
//

import SwiftUI

struct CocktailDetailView: View {
    var cocktail: Cocktail
    var body: some View {
      
        ZStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(cocktail.mainImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 320)
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
                            Image("spirit")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Cointreau, Vodka, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice, Orange Juice, Cointreau, Vodka, Orange Juice")
                                .font(.body)
                                .foregroundColor(Color.gray)
                                .lineLimit(20)
                        }
                    }.padding()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(28)
                .shadow(radius: 10)
                }
            }
        }
    }
}

struct CocktailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailView(cocktail: Cocktail.example)
    }
}
