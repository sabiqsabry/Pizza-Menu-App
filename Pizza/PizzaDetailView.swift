//
//  PizzaDetailView.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-05.
//

import SwiftUI

struct PizzaDetailView: View {
    var selectedPizzaItem: PizzaEntity
    @ObservedObject var viewModel: PizzaViewModel
    @State private var isFavorite = false
    
    init(selectedPizzaItem: PizzaEntity, viewModel: PizzaViewModel) {
        self.selectedPizzaItem = selectedPizzaItem
        self.viewModel = viewModel
        self.isFavorite = selectedPizzaItem.isFavorite
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(selectedPizzaItem.imageName ?? "")
                    .resizable()
                    .frame(height: 400)
                
                VStack(spacing: 20) {
                    Text(selectedPizzaItem.name ?? "")
                        .font(.title)
                    VStack {                    
                        Text("Ingredients")
                            .fontWeight(.semibold)
                        Text(selectedPizzaItem.ingredients ?? "")
                    }
                }

                Form {
                    Toggle("Favorite", isOn: $isFavorite)
                }
            }
            .navigationTitle(Text(selectedPizzaItem.name ?? ""))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

//struct PizzaDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PizzaDetailView()
//    }
//}
