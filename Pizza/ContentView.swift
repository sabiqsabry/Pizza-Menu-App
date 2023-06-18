//
//  ContentView.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PizzaViewModel()
    
    var body: some View {
        TabView {
            PizzaListView(viewModel: viewModel)
                .tabItem {
                    Label("Pizza List", systemImage: "list.bullet")
                }
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
