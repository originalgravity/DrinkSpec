//
//  CategoryView.swift
//  Floral
//
//  Created by James Evans on 30/04/2020.
//  Copyright © 2020 James Evans. All rights reserved.
//

import SwiftUI

struct CategoryCard: View {
    var category: Category
    var body: some View {
        NavigationLink(destination: Text("text")) {
            ZStack(alignment: .bottomTrailing) {
                    Button(action: {
                        print("Button pressed \(self.category.name)")
                    }) {
                        Image(category.mainImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 100)
                                .clipped()
                                .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                
        
                Text(category.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .offset(x: -5, y: -5)
            }       .shadow(radius: 10)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: Category.example)
    }
}
