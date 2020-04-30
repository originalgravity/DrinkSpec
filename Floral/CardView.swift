//
//  CardView.swift
//  Floral
//
//  Created by James Evans on 30/04/2020.
//  Copyright © 2020 James Evans. All rights reserved.
//

import SwiftUI

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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cocktail: Cocktail.example)
    }
}
