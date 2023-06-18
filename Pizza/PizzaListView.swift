//
//  PizzaLIstView.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-16.
//

import SwiftUI

struct PizzaListView: View {
    @ObservedObject var viewModel: PizzaViewModel
    
    @State private var pickedType = "all"
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
             Picker("Pizzas", selection: $pickedType) {
                Text("All 🍕").tag("all")
                 Text("🥩 Meat").tag(PizzaType.Meat.rawValue)
                 Text("🥗 Veg").tag(PizzaType.Veg.rawValue)
             }.padding()
            .pickerStyle(.segmented)
            List {
                ForEach(viewModel.filterByType(type: pickedType), id: \.self) { pizza in
                    
                // JSON data from network store
//                ForEach(NetworkStore.shared.getPizzas(forType: PizzaType(rawValue: pickedType)), id: \.self) { pizza in
                    NavigationLink {
                        PizzaDetailView(selectedPizzaItem: pizza, viewModel: viewModel)
                    } label: {
                        HStack(spacing: 20) {
                            Image(pizza.thumbnailName ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80)
                            Text(pizza.name ?? "")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .navigationTitle(Text("Pizzas"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.task {
            NetworkStore.shared.loadJSON()
        }.sheet(isPresented: $isPresented) {
            AddPizzaView(viewModel: viewModel)
        }
    }
}

struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView(viewModel: PizzaViewModel())
    }
}
